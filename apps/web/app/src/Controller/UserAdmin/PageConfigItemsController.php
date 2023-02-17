<?php

namespace App\Controller\UserAdmin;

use Cake\Event\EventInterface;
use App\Model\Entity\PageConfigItem;
use App\Model\Entity\Info;
use Cake\Filesystem\Folder;
use Cake\Filesystem\File;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class PageConfigItemsController extends AppController
{


    public function initialize(): void
    {
        parent::initialize();

        $this->Infos = $this->getTableLocator()->get('Infos');
        $this->SiteConfigs = $this->getTableLocator()->get('SiteConfigs');
        $this->PageConfigs = $this->getTableLocator()->get('PageConfigs');
        $this->UseradminSites = $this->getTableLocator()->get('UseradminSites');
    }


    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
        $this->viewBuilder()->setLayout("user");


        $this->setCommon();

        $this->modelName = $this->name;
        $this->set('ModelName', $this->modelName);
    }


    protected function _getQuery()
    {
        $query = [];

        $query['page_id'] = $this->request->getQuery('page_id');
        $query['page_slug'] = $this->request->getQuery('page_slug');

        return $query;
    }


    protected function _getConditions($query)
    {
        $cond = [];
        return $cond;
    }


    public function index()
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("index");
        $this->viewBuilder()->setClassName('Useradmin');

        $query = $this->_getQuery();
        $this->set(compact('query'));

        $this->setList();

        if (!empty($query['page_id'])) {
            $page_config = $this->PageConfigs->find()->where(['PageConfigs.id' => $query['page_id']])->first();
        } elseif (!empty($query['page_slug'])) {
            $page_config = $this->PageConfigs->find()->where(['PageConfigs.slug' => $query['page_slug']])->first();
            if (!empty($page_config)) {
                $query['page_id'] = $page_config->id;
            }
        }
        if (empty($page_config)) {
            return $this->redirect('/user_admin/');
        }

        $current_site_id = $this->Session->read('current_site_id');
        $site_config = $this->SiteConfigs->find()->where(['SiteConfigs.id' => $current_site_id])->first();

        $this->set(compact('site_config', 'page_config'));

        $cond = ['PageConfigItems.page_config_id' => $page_config->id];

        $this->_lists($cond, [
            'order' => 'PageConfigItems.position ASC',
            'limit' => null
        ]);
    }


    public function edit($id = 0)
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("edit");
        $this->viewBuilder()->setClassName('Useradmin');

        $query = $this->_getQuery();

        $page_config = null;
        if ($query['page_id'] || $query['page_slug']) {
            $cond = $query['page_id'] ? ['PageConfigs.id' => $query['page_id']] : ['PageConfigs.slug' => $query['page_slug']];
            $page_config = $this->PageConfigs->find()->where($cond)->first();
        }

        if (is_null($page_config)) return $this->redirect('/user_admin/');

        $view = 'edit';
        $this->setList();

        $current_site_id = $this->Session->read('current_site_id');
        $site_config = $this->SiteConfigs->find()->where(['SiteConfigs.id' => $current_site_id])->first();

        $options['contain'] = ['PageConfigs'];
        $options['redirect'] = false;
        $this->set(compact('page_config', 'query'));

        $entity = parent::_edit($id, $options);

        if ($this->request->is(['post', 'put'])) {
            $path_element = __('{0}/templates/UserAdmin/element', dirname(APP));
            $sub_path = __('{0}/{1}', $entity->parts_type == 'main' ? $entity->parts_type : 'block', $page_config->slug);

            $temp = $entity->item_type;

            if ($entity->parts_type == 'main') $file_name = $entity->item_key;
            else $file_name = strtolower(Info::$block_number2key_list[$temp]);

            $old_file = __('{0}/Block/{1}/{2}.php', $path_element, $sub_path, $file_name);

            $is_old_file = is_file($old_file);
            if ($is_old_file) unlink($old_file);

            $dir = __('{0}/Block/{1}', $path_element, $sub_path);
            if (!is_dir($dir)) new Folder($dir, true, 0755);

            if ($entity->parts_type != 'main') $temp = __('block/{0}', $file_name);

            $content = file_get_contents(__('{0}/Block/default/{1}.txt', $path_element, $temp), true);
            $file = new File($old_file, true, 0777);
            $file->write($content);

            $this->redirect(['action' => 'index', '?' => $query]);
        }
        $this->render($view);
    }


    public function delete($id, $type, $columns = null)
    {
        $this->checkLogin();

        $query = $this->_getQuery();

        if (!$this->isOwnPageByUser($query['page_id'])) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user_admin/');
            return;
        }

        $options['redirect'] = ['action' => 'index', '?' => $query];
        parent::_delete($id, $type, $columns, $options);
    }


    public function position($id, $pos)
    {
        $this->checkLogin();
        $query = $this->_getQuery();

        if (!$this->isOwnPageByUser($query['page_id'])) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user_admin/');
            return;
        }

        $options = [];

        $data = $this->{$this->modelName}->find()->where([$this->modelName . '.id' => $id])->first();
        if (empty($data)) {
            $this->redirect('/user_admin/');
            return;
        }

        $options['redirect'] = ['action' => 'index', '?' => ['page_id' => $data->page_config_id],];

        return parent::_position($id, $pos, $options);
    }


    public function enable($id)
    {
        $query = $this->_getQuery();

        $options = [
            'status_true' => 'Y',
            'status_false' => 'N',
            'redirect' => ['action' => 'index', '?' => $query]
        ];

        parent::_enable($id, $options);
    }


    public function setList()
    {
        $list['parts_type_list'] = PageConfigItem::$type_list;

        $list['value_type_list'] = [
            'text' => 'テキスト型',
            'date' => '日付型',
            'datetime' => '日付時間型',
            'select' => 'list型',
            'checkbox' => 'checkbox型',
            'radio' => 'radio型',
            'textarea' => 'テキストエリア型',
            'WYSIWYG' => 'WYSIWYG型',
            'file' => 'file型',
            'image' => '画像型',
        ];

        $list['value_type_list_block'] = Info::BLOCK_TYPE_LIST;
        $list['value_type_list_section'] = [10 => '枠'];

        if (!empty($list)) {
            $this->set(array_keys($list), $list);
        }

        $this->list = $list;
        return $list;
    }
}
