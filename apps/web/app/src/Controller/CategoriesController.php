<?php

namespace App\Controller;

use Cake\Event\EventInterface;

class CategoriesController extends AppController
{

    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
        $this->slug = 'categories';
    }


    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
    }


    public function index()
    {
        $this->setList();
        $infos = $this->Cms->findAll($this->slug, ['limit' => '1', 'paginate' => true]);
        $this->set(compact('infos'));
    }


    public function detail($id = null)
    {
        $info_array = $this->Cms->findFirst($this->slug, $id);
        if (is_null($info_array)) return $this->redirect(['action' => 'index']);
        $info = $info_array['info'] ?? [];
        extract($info_array);

        $this->set(compact('contents', 'info'));
    }


    public function setList()
    {
        $list = [];

        $list['category'] = $this->loadModel('Categories')
            ->find('all')
            ->where([
                'Categories.status' => 'publish',
                'PageConfigs.slug' => $this->slug
            ])
            ->contain('PageConfigs')
            ->order('Categories.position ASC')
            ->toArray();

        if (!empty($list)) $this->set(array_keys($list), $list);
        return $list;
    }
}
