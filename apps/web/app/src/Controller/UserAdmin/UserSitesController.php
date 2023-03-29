<?php

/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link      https://cakephp.org CakePHP(tm) Project
 * @since     0.2.9
 * @license   https://opensource.org/licenses/mit-license.php MIT License
 */

namespace App\Controller\User;

use Cake\Event\Event;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class UserSitesController extends AppController
{

    public function beforeFilter(Event $event)
    {
        $action = $this->request->getParam('action');
        parent::beforeFilter($event);
        $this->checkLogin();
        $user_menu_list = $this->__getListUserSite();
        if (!in_array($action, ['listCategory', 'deleteCategory', 'editCategory'], true)) {
            if (!$this->Session->check('current_site_id') || $this->Session->read('current_site_id') == -1) return $this->redirect(['prefix' => 'user', 'controller' => 'users', 'action' => 'logout']);
            $header = $user_menu_list[$this->Session->read('current_site_id')];
        } else {
            $header = 'カテゴリー管理';
        }
        $this->viewBuilder()->setLayout("user");

        $this->setHeadTitle($header, true);
        $this->setList();
        if (in_array($this->request->action, ['uploadFiles'])) {
            $this->getEventManager()->off($this->Csrf);
        }
    }


    public function index()
    {
    }


    public function listEvent()
    {
        $this->set('list_cat', $this->__getListCategory(true));
        $this->set('datas', $this->__getListEvents());
    }


    public function editEvent($id = null)
    {
        // dd($this->request->getData());
        $model = $this->loadModel('Events');
        $site_id = $this->Session->read('current_site_id');

        $entity = $id ? $this->Events->find()
            ->where(['Events.id' => $id, 'config_site_id' => $site_id])
            ->contain('EventAttached')
            ->first()
            : $model->newEntity();

        if ($id && is_null($entity)) {
            // 一覧画面の掲載中・下書きの場合
            if ($this->request->is('ajax')) {
                echo json_encode(['success' => false]);
                exit();
            }
            return $this->redirect(['action' => 'listEvent']);
        };

        // process data
        $this->processEditCopy($entity);

        $this->set('entity', $entity);
    }


    public function copyEvent($id = null)
    {
        $model = $this->loadModel('Events');
        $site_id = $this->Session->read('current_site_id');
        $__id__ = $id;
        //　複写ボタンを押す時
        $id = $this->request->is(['post', 'put']) ? null : $id;

        $entity = $id ? $this->Events->find()
            ->where(['Events.id' => intval($id), 'config_site_id' => $site_id])
            ->contain('EventAttached')
            ->first()
            : $model->newEntity();

        if (!$this->request->is(['post', 'put']) && (!$entity || $entity->isNew())) return $this->redirect(['action' => 'listEvent']);
        $entity->__id = $__id__;
        // process data
        $this->processEditCopy($entity);

        $entity->id = -1;

        $this->set('entity', $entity);
        $this->render('edit_event');
    }


    protected function processEditCopy($entity)
    {
        $this->set('list_cat', $this->__getListCategory(true));
        $model = $this->loadModel('Events');
        $site_id = $this->Session->read('current_site_id');
        $hash_code = $this->Session->read('code_upload');

        // 館毎のイメージ保存パス
        $dir_image = __('upload/{0}/events/{1}/image/', [$site_id, '{0}']);
        // イベント毎のイメージ保存仮パス
        $tmp_upload_image = __('upload_tmp/{0}/', [$hash_code]);

        // 館毎のファイル保存パス
        $dir_files = __('upload/{0}/events/{1}/files/', [$site_id, '{0}']);
        // イベント毎のファイル保存仮パス
        $tmp_upload_file = __('upload_file_tmp/{0}/', [$hash_code]);

        // 登録・更新ボタン
        if ($this->request->is(['post', 'put'])) {
            $data = $this->request->getData();

            // Ckeditorの各イメージ
            $image = @$data['image'];
            // Ckeditorの各ファイル
            $files_in_content = @$data['_files'];
            // 添付ファイル
            $files_attach = @$data['__files'];

            $data_file = [
                'files_in_content' => $files_in_content,
                'files_attach' => $files_attach,
            ];


            // 使わないデータをRemove
            unset($data['id'], $data['files'], $data['_files'], $data['__files'], $data['image']);

            $data['config_site_id'] = $site_id;
            // statusは「'publish', 'draft'」以外の場合、Removeしてから新しいバリューをセットする
            if (isset($data['status']) && !in_array($data['status'], ['publish', 'draft'], true)) unset($data['status']);
            $data['status'] = !isset($data['status']) ? 'draft' : $data['status'];

            $entity = $model->patchEntity($entity, $data);

            // バリデー：　エラーがない場合
            if (empty($entity->getErrors())) {
                // データ保存
                $save = $model->save($entity);

                // 一覧画面の掲載中・下書きの場合
                if ($this->request->is('ajax')) {
                    echo json_encode(['success' => true]);
                    exit();
                }
                $_id = $save->id;

                $dir_img = __($dir_image, [$_id]);
                $dir_file = __($dir_files, [$_id]);

                // upload image
                $entity->content = str_replace($tmp_upload_image, $dir_img, $entity->content);

                if ($save->__id) {
                    $entity->content = str_replace(__($dir_image, [$save->__id]), $dir_img, $entity->content);
                    $entity->content = str_replace(__($dir_files, [$save->__id]), $dir_file, $entity->content);
                }

                $this->__upload($dir_img, $tmp_upload_image, $image);

                // upload file
                $dir_file = __($dir_files, [$_id]);
                $tmp_file = $this->__upload($dir_file, $tmp_upload_file, $data_file, 'files');

                foreach ($tmp_file['files_in_content'] as $tmp) {
                    $entity->content = str_replace($tmp[1], $tmp[0], $entity->content);
                }

                $model->save($entity);

                $model_event_attached = $this->loadModel('EventAttached');
                $model_event_attached->deleteAll(['event_id' => $_id, 'site_id' => $site_id]);

                if (!empty($tmp_file['files_attach'])) {
                    $data_files = array_map(function ($dt) use ($_id, $site_id) {
                        $dt['event_id'] = $_id;
                        $dt['site_id'] = $site_id;
                        return $dt;
                    }, $tmp_file['files_attach']);

                    $entities = $model_event_attached->newEntities($data_files);
                    $model_event_attached->saveMany($entities);
                }
                $this->Session->delete('code_upload');
                return $this->redirect(['action' => 'listEvent']);
            }
        } else {
            if ($this->Session->check('code_upload')) {
                // 仮パスをRemove
                system(escapeshellcmd(__('rm -rf {0}{1}', [WWW_ROOT, $tmp_upload_image])));
                system(escapeshellcmd(__('rm -rf {0}{1}', [WWW_ROOT, $tmp_upload_file])));
                $this->Session->delete('code_upload');
            }
        }
    }


    public function deleteEvent($id)
    {
        $this->loadModel('Events');
        $entity = $this->Events->find()
            ->where(['Events.id' => $id, 'config_site_id' => $this->Session->read('current_site_id')])
            ->contain('EventAttached')
            ->first();

        if ($entity) {
            $this->Events->delete($entity);
            system(escapeshellcmd(__('rm -rf {0}upload/{1}/events/{2}', [WWW_ROOT, $this->Session->read('current_site_id'), $id])));
        }

        return $this->redirect(['action' => 'listEvent']);
    }


    public function listCategory()
    {
        $this->Session->write('current_site_id', -1);
        $this->set('datas', $this->__getListCategory());
    }


    public function editCategory($id = null)
    {

        $model = $this->loadModel('Categories');

        $entity = $id ? $model->find(
            'all',
            [
                'conditions' => [
                    'Categories.id' => $id,
                    // 'config_site_id' => $this->Session->read('current_site_id')
                ]
            ]
        )->first() : $model->newEntity();

        if ($id && is_null($entity)) return $this->redirect(['action' => 'listCategory']);

        if ($this->request->is(['post', 'put', 'ajax'])) {
            $data = $this->request->getData();

            unset($data['id']);
            if (isset($data['status']) && !in_array($data['status'], ['publish', 'draft'], true)) unset($data['status']);
            $data['config_site_id'] = 0;

            $entity = $model->patchEntity($entity, $data);

            if (empty($entity->getErrors())) {
                $model->save($entity);
                if ($this->request->is('ajax')) {
                    echo json_encode(['success' => true]);
                    exit();
                }
                return $this->redirect(['action' => 'listCategory']);
            }
        }
        $this->Session->write('current_site_id', -1);
        $this->set('entity', $entity);
    }


    public function deleteCategory($id)
    {
        $this->loadModel('Categories');
        $entity = $this->Categories->find()
            ->where(['Categories.id' => $id])
            ->contain('Events')
            ->first();

        if ($entity)
            $this->Categories->delete($entity);

        return $this->redirect(['action' => 'listCategory']);
    }


    public function listHolidays()
    {
        $site_id = $this->Session->read('current_site_id');
        $query = $this->loadModel('Holidays')
            ->find('all')
            ->where(['config_site_id' => $site_id])
            ->order(['holiday ASC']);

        $this->set('count', $query->count());
        $this->set('datas', $query->toArray());
    }


    public function editHolidays($id = null)
    {

        $model = $this->loadModel('Holidays');
        $site_id = $this->Session->read('current_site_id');

        $entity = $id ? $this->Holidays->find()
            ->where(['Holidays.id' => $id, 'config_site_id' => $site_id])
            ->first()
            : $model->newEntity();

        if ($id && is_null($entity)) return $this->redirect(['action' => 'listHolidays']);

        if ($this->request->is(['post', 'put'])) {
            $data = $this->request->getData();

            unset($data['id']);
            $data['config_site_id'] = $site_id;
            $entity = $model->patchEntity($entity, $data);

            if (empty($entity->getErrors())) {
                $model->save($entity);
                return $this->redirect(['action' => 'listHolidays']);
            }
        }
        $this->set('entity', $entity);
    }


    public function deleteHolidays($id)
    {
        $this->loadModel('Holidays');
        $site_id = $this->Session->read('current_site_id');

        $entity = $this->Holidays->find()
            ->where(['Holidays.id' => $id, 'config_site_id' => $site_id])
            ->first();

        if ($entity)
            $this->Holidays->delete($entity);

        return $this->redirect(['action' => 'listHolidays']);
    }


    public function uploadImageEvent()
    {
        if ($this->request->is(['post', 'put'])) {
            $upload_file = (array) $this->request->getData('upload');
            $data = $this->__uploadTmp('upload_tmp', 'upload', [$upload_file]);
            echo json_encode($data[0]);
            exit();
        }
        return $this->redirect(['prefix' => 'user', 'controller' => 'users', 'action' => 'logout']);
    }


    public function uploadFiles()
    {
        if ($this->request->is(['post', 'put'])) {
            $upload_file = (array) $this->request->getData('files');
            $data = $this->__uploadTmp('upload_file_tmp', 'files', $upload_file);
            echo json_encode(['success' => true, 'data' => $data]);
            exit();
        }
        return $this->redirect(['prefix' => 'user', 'controller' => 'users', 'action' => 'logout']);
    }


    protected function __uploadTmp($tmpFolder = 'upload_tmp', $type, $datas)
    {
        if (!$this->Session->check('code_upload')) $this->Session->write('code_upload', md5(round(microtime(true) * 10000)));

        $folder_name = $this->Session->read('code_upload');

        $exts = $type == 'files' ? ['pdf', 'csv', 'xlsx', 'xls', 'doc', 'docx'] : ['jpg', 'jpeg', 'gif', 'png'];

        $upload_file = $datas;
        $return = [];

        for ($i = 0; $i < count($upload_file); $i++) {
            $upload = $upload_file[$i];
            if (!empty($upload['tmp_name']) && $upload['error'] === UPLOAD_ERR_OK) {

                $ext = strtolower(substr(strrchr($upload['name'], '.'), 1));

                if (in_array($ext, $exts)) {

                    $newname = __('{0}_{1}.{2}', [$folder_name, round(microtime(true) * 10000), $ext]);
                    $dir = __('{0}{1}/{2}', [WWW_ROOT, $tmpFolder, $folder_name]);
                    if (!is_dir($dir)) {
                        (new \Cake\Filesystem\Folder())->create($dir, 0777);
                    }

                    move_uploaded_file($upload['tmp_name'], $dir . '/' . $newname);
                    chmod($dir . '/' . $newname, 0777);

                    $return[] = ['url' => __('/{0}/{1}/{2}', [$tmpFolder, $folder_name, $newname]), 'original_name' => $upload['name'], 'class' => $ext, 'element' => [$upload['name']]];
                }
            }
        }
        return $return;
    }


    protected function __getListCategory($isFront = false)
    {
        $cond = $isFront
            ?
            [
                'status' => 'publish',
                'publish_at <=' => new \DateTime()
            ]
            : [];

        $query = $this->loadModel('Categories')
            ->find('all')
            ->where($cond)
            ->order(['id DESC']);

        $this->set('count', $query->count());

        return $query
            ->toArray();
    }


    protected function __getListEvents($isFront = false)
    {
        $cond = $isFront
            ?
            [
                'Events.config_site_id' => $this->Session->read('current_site_id'),
                'Categories.status' => 'publish',
                'Events.status' => 'publish',
                'Events.start_at <=' => new \DateTime()
            ]
            : ['Events.config_site_id' => $this->Session->read('current_site_id'), 'Categories.status' => 'publish'];

        $cat_id = $this->request->getQuery('category_id');

        if ($cat_id) {
            $cond['Events.category_id'] = intval($cat_id);
            $this->set('cat_id', $cat_id);
        }

        $query = $this->loadModel('Events')
            ->find('all')
            ->where($cond)
            ->contain(['Categories', 'SiteConfigs']);

        $query = $this->paginate($query, [
            'limit' => 10,
            'order' => [
                'Events.start_at' => 'DESC',
                'Events.id' => 'DESC'
            ],
        ]);

        $this->set('count', $query->count());

        return $query
            ->toArray();
    }


    protected function __upload($dir, $dir_tmp, $data_upload, $type = 'image')
    {
        $result = [];

        if (!empty($data_upload)) {
            // 共通 folder
            $common_tmp = WWW_ROOT . md5($dir);
            (new \Cake\Filesystem\Folder())->create($common_tmp, 0777);

            // 共通 folderにファイルを移動する
            if ($type == 'image')
                for ($i = 0; $i < count($data_upload); $i++) system(escapeshellcmd(__('cp -f {0} {1}/', [WWW_ROOT . ltrim($data_upload[$i], '/'), $common_tmp])));
            else if ($type == 'files') {
                foreach ($data_upload as $place => $place_data) {
                    $result[$place] = [];
                    if ($place_data) {
                        foreach ($place_data as $orignal_file_name => $path_tmp) {
                            $file = explode('/', $path_tmp);

                            if ($place == 'files_in_content') {
                                if (count($file) > 2 && in_array($file[1], ['upload_file_tmp', 'upload'])) {
                                    // Postしてくれるファイルは共通 folderに移動する
                                    if ($file[1] === 'upload_file_tmp') $result[$place][] = ['/' . $dir . end($file), $path_tmp];
                                    system(escapeshellcmd(__('cp -f {0} {1}/', [WWW_ROOT . ltrim($path_tmp, '/'), $common_tmp])));
                                }
                            } else {
                                $_data_file['file_name'] = end($file);
                                $_data_file['original_file_name'] = $orignal_file_name;
                                $file_exp = explode('.', $_data_file['file_name']);
                                $_data_file['extension'] = end($file_exp);

                                $result[$place][] = $_data_file;
                                // Postしてくれるファイルは共通 folderに移動する
                                system(escapeshellcmd(__('cp -f {0} {1}/', [WWW_ROOT . ltrim($path_tmp, '/'), $common_tmp])));
                            }
                        }
                    }
                };
            }
            // 存在しているファイルが削除する
            if (is_dir($dir)) array_map('unlink', array_filter((array) glob(__('{0}{1}*', [WWW_ROOT, $dir]))));
            // 逆に、新しいフォルダを作成する
            else (new \Cake\Filesystem\Folder())->create(__('{0}{1}', [WWW_ROOT, $dir]), 0777);

            // 共通 folderから実パスにファイルを移動する
            rename($common_tmp . '/', WWW_ROOT . $dir);

            // 共通 folderのファイルを全て削除する
            if (is_dir($common_tmp)) system(escapeshellcmd(__('rm -rf {0}', [$common_tmp])));

            // Tmp folderのファイルも全て削除する
            if (is_dir(WWW_ROOT . $dir_tmp)) system(escapeshellcmd(__('rm -rf {0}{1}', [WWW_ROOT, $dir_tmp])));
        } else {
            // 存在しているファイルが削除する
            if (is_dir($dir)) array_map('unlink', array_filter((array) glob(__('{0}{1}*', [WWW_ROOT, $dir]))));
        }
        return $result;
    }


    public function setList()
    {
        $list = [];

        $list['user_menu_list'] = $this->__menuList();

        $list['list_color'] = [
            ['value' => 'col00', 'text' => '', 'label' => ['class' => 'col0 col00']],
            ['value' => 'col01', 'text' => '', 'label' => ['class' => 'col0 col01']],
            ['value' => 'col02', 'text' => '', 'label' => ['class' => 'col0 col02']],
            ['value' => 'col03', 'text' => '', 'label' => ['class' => 'col0 col03']],
            ['value' => 'col04', 'text' => '', 'label' => ['class' => 'col0 col04']],
            ['value' => 'col05', 'text' => '', 'label' => ['class' => 'col0 col05']],
            ['value' => 'col06', 'text' => '', 'label' => ['class' => 'col0 col06']]
        ];

        if (!empty($list)) $this->set(array_keys($list), $list);

        return $list;
    }
}
