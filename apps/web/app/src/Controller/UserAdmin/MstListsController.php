<?php

namespace App\Controller\UserAdmin;

use Cake\Event\EventInterface;
use App\Model\Entity\MstList;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class MstListsController extends AppController
{


    public function initialize(): void
    {
        parent::initialize();

        $this->MstLists = $this->getTableLocator()->get('MstLists');
        $this->AppendItems = $this->getTableLocator()->get('AppendItems');
        $this->PageConfigs = $this->getTableLocator()->get('PageConfigs');

        $this->modelName = 'MstLists';
        $this->set('ModelName', $this->modelName);
    }


    public function beforeFilter(EventInterface $event)
    {
        $this->viewBuilder()->setLayout("user");
        $this->viewBuilder()->setClassName('Useradmin');

        $this->setCommon();
    }


    public function index()
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("index_2");

        if (!$this->isUserRole('admin')) {
            $this->Flash->set('不正なアクセスです');
            return $this->redirect('/');
        }

        $query = $this->_getQuery();
        $this->setList($query);

        if (!$this->isUserRole('develop'))
            $query['list_code'] = MstList::LIST_FOR_USER;

        $this->set(compact('query'));

        $cond = $this->_getConditions($query);

        $contain = [];
        $this->_lists($cond, [
            'order' => [$this->modelName . '.position' =>  'ASC'],
            'limit' => null,
            'contain' => $contain
        ]);
    }


    public function edit($id = 0)
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("edit");

        $query = $this->_getQuery();
        $this->setList($query);

        $this->set(compact('query'));
        $redirect = null;
        $create = [];
        $old_data = null;
        $redirect = ['action' => 'index', '?' => $query];

        if (empty($query['sys_cd'])) return $this->redirect(['action' => 'index']);

        if ($this->request->is(['get'])) {
            if (!$id) {
                $create = [
                    'id' => null,
                    'sys_cd' => $query['sys_cd'],
                    'position' => 0
                ];
                if ($query['slug']) {
                    $mst_list = $this->MstLists
                        ->find()
                        ->where(['MstLists.sys_cd' => $query['sys_cd'], 'MstLists.slug' => $query['slug']])
                        ->first();

                    if (!empty($mst_list)) {
                        $create['sys_cd'] = $mst_list->sys_cd;
                        $create['slug'] = $mst_list->slug;
                        $create['name'] = $mst_list->name;
                    }
                }
            }
        }

        if ($id) $old_data = $this->MstLists->find()->where(['MstLists.id' => $id])->first();

        $callback = function ($id) use ($old_data) {
            $data = $this->MstLists->find()->where(['MstLists.id' => $id])->first();
            if (!is_null($old_data)) {

                $update = [
                    'name' => $data->name,
                    'slug' => $data->slug
                ];

                if ($data->name != $old_data->name || $data->slug != $old_data->slug)
                    $this->MstLists->updateAll($update, ['sys_cd' => $data->sys_cd, 'slug' => $old_data->slug]);
            }
            return true;
        };

        $options = [
            'redirect' => $redirect,
            'callback' => $callback,
            'create' => $create
        ];

        parent::_edit($id, $options);
    }


    public function delete($id = 0, $type, $columns = null)
    {
        $this->checkLogin();

        if (empty($id)) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user/');
            return;
        }
        $query = $this->_getQuery();
        $data = $this->{$this->modelName}->find()->where([$this->modelName . '.id' => $id])->first();

        if (empty($data)) {
            $this->redirect('/user/');
            return;
        }

        $options = ['redirect' => ['action' => 'index', '?' => $query]];

        parent::_delete($id, $type, $columns, $options);
    }


    public function position($id, $pos)
    {
        $this->checkLogin();


        $query = $this->_getQuery();

        $options = [];

        $data = $this->{$this->modelName}->find()->where([$this->modelName . '.id' => $id])->first();

        if (empty($data)) {
            $this->redirect(['action' => 'index']);
            return;
        }

        $options['redirect'] = ['action' => 'index', '?' => $query];

        return parent::_position($id, $pos, $options);
    }


    public function _getQuery()
    {
        $query['sys_cd'] = $this->request->getQuery('sys_cd');
        if (is_null($query['sys_cd'])) $query['sys_cd'] = MstList::LIST_FOR_USER;
        $query['slug'] = $this->request->getQuery('slug');
        return $query;
    }


    public function _getConditions($query)
    {
        if (!is_null($query['slug']) && $query['slug'] != '') $cond['MstLists.slug'] = $query['slug'];
        $cond['MstLists.sys_cd'] = $query['sys_cd'];
        return $cond;
    }


    public function setList($query)
    {
        $list = array();

        $list['sys_list'] = MstList::$sys_list;

        if (!$this->isUserRole('admin'))
            unset($list['sys_list'][MstList::LIST_FOR_ADMIN]);

        $sys_cd = $query['sys_cd'];

        $cond = ['MstLists.sys_cd' => $sys_cd];

        $list['slug_list'] = $this->MstLists
            ->find('list', [
                'keyField' => 'slug',
                'valueField' => 'name'
            ])
            ->where($cond)
            ->group(['sys_cd', 'slug'])
            ->order(['MstLists.id' => 'ASC'])
            ->all()
            ->toArray();

        if (!empty($list)) $this->set(array_keys($list), $list);

        $this->list = $list;
        return $list;
    }


    public function getTargetList($query = [])
    {
        $list = [];

        $cond = [];

        if (!empty($query['list_code'])) {
            $cond['MstLists.sys_cd'] = $query['list_code'];
        }

        $datas = $this->MstLists->find('list', ['keyField' => 'use_target_id', 'valueField' => 'list_name'])->where($cond)->group('use_target_id')->order(['use_target_id' => 'ASC', 'position' => 'ASC'])->toArray();

        if (empty($datas)) {
            return $list;
        }
        $list = $datas;
        return $list;
    }


    protected function getMaxVals($query)
    {
        $num = 1;
        $cond['MstLists.use_target_id'] = $query['target_id'];
        $cond['MstLists.sys_cd'] = $query['list_code'];


        $datas = $this->MstLists->find()
            ->where($cond)
            ->all();

        if (empty($datas)) {
            return $num;
        }

        foreach ($datas as $data) {
            if ($num <= intval($data['ltrl_val'])) {
                $num = intval($data['ltrl_val']) + 1;
            }
        }

        return $num;
    }
}
