<?php

namespace App\Controller\UserAdmin;

use Cake\Event\EventInterface;
use App\Model\Entity\AppendItem;
use Cake\Filesystem\Folder;
use Cake\Filesystem\File;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class AppendItemsController extends AppController
{

    public function initialize(): void
    {
        parent::initialize();

        $this->Infos = $this->getTableLocator()->get('Infos');
        $this->SiteConfigs = $this->getTableLocator()->get('SiteConfigs');
        $this->PageConfigs = $this->getTableLocator()->get('PageConfigs');
        $this->AppendItems = $this->getTableLocator()->get('AppendItems');
        $this->MstLists = $this->getTableLocator()->get('MstLists');
        $this->UseradminSites = $this->getTableLocator()->get('UseradminSites');
    }


    public function beforeFilter(EventInterface $event)
    {

        parent::beforeFilter($event);
        $this->viewBuilder()->setLayout("user");
        $this->viewBuilder()->setClassName('Useradmin');

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
        $query = $this->_getQuery();

        $this->setList();

        $page_config = $this->page_config;

        $current_site_id = $this->Session->read('current_site_id');
        $site_config = $this->SiteConfigs->find()->where(['SiteConfigs.id' => $current_site_id])->first();

        $this->set(compact('site_config', 'page_config', 'query'));

        $cond = ['AppendItems.page_config_id' => $page_config->id];

        $this->_lists($cond, [
            'order' => 'AppendItems.position ASC',
            'limit' => null
        ]);
    }


    public function edit($id = 0)
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("edit");
        $query = $this->_getQuery();

        $view = 'edit';
        $this->setList();

        $page_config = $this->page_config;

        $current_site_id = $this->Session->read('current_site_id');
        $site_config = $this->SiteConfigs->find()->where(['SiteConfigs.id' => $current_site_id])->first();

        $options['contain'] = ['PageConfigs'];
        $options['redirect'] = false;
        $this->set(compact('page_config', 'query'));

        $entity = parent::_edit($id, $options);

        if ($this->request->is(['post', 'put'])) {
            $path_element = __('{0}/templates/UserAdmin/element', dirname(APP));
            $sub_path = __('append/{0}', $page_config->slug);
            $old_file = __('{0}/Block/{1}/{2}.php', $path_element, $sub_path, $entity->slug);

            $is_old_file = is_file($old_file);
            if ($is_old_file) unlink($old_file);

            $dir = __('{0}/Block/{1}', $path_element, $sub_path);
            if (!is_dir($dir)) new Folder($dir, true, 0755);

            $content = file_get_contents(__('{0}/Block/default/{1}.txt', $path_element, $entity->item_type), true);
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
            $this->redirect('/user/');
            return;
        }

        $options = [];

        $data = $this->AppendItems->find()->where(['AppendItems.id' => $id])->first();
        if (empty($data)) {
            $this->redirect('/user/');
            return;
        }

        $options['redirect'] = ['action' => 'index', '?' => ['page_id' => $data->page_config_id],];

        return parent::_position($id, $pos, $options);
    }


    public function setList()
    {
        $query = $this->_getQuery();

        $page_config = null;
        if ($query['page_id'] || $query['page_slug']) {
            $cond = $query['page_id'] ? ['PageConfigs.id' => $query['page_id']] : ['PageConfigs.slug' => $query['page_slug']];
            $page_config = $this->PageConfigs->find()->where($cond)->first();
        }

        if (is_null($page_config)) return $this->redirect('/user/');

        $this->page_config = $page_config;

        $list['value_type_list'] = [
            'text' => 'テキスト型',
            'start_datetime' => 'start_datetime',
            'datetime' => '日付時間型',
            'select' => 'list型',
            'checkbox' => 'checkbox型',
            'radio' => 'radio型',
            'textarea' => 'テキストエリア型',
            'WYSIWYG' => 'WYSIWYG型',
            'file' => 'file型',
            'image' => '画像型',
        ];

        $list['target_list'] = $this->getTargetList();

        $list['edit_pos_list'] = $this->fetchTable('PageConfigItems')
            ->find('list', [
                'keyField' => 'item_key',
                'valueField' => function ($article) {
                    return __('【{0}】の下', $article->title != '' ? $article->title : $article->item_key);
                }
            ])
            ->where([
                'page_config_id' => $page_config->id,
                'parts_type' => 'main',
                'status' => 'Y',
            ])
            ->contain(['PageConfigs'])
            ->order(['PageConfigItems.position' => 'ASC'])
            ->toArray();


        if (!empty($list)) {
            $this->set(array_keys($list), $list);
        }

        $this->list = $list;
        return $list;
    }


    public function getTargetList()
    {
        return $this->MstLists
            ->find('list', ['keyField' => 'slug', 'valueField' => 'name'])
            ->group('slug')
            ->order(['id' => 'ASC'])
            ->toArray();
    }
}
