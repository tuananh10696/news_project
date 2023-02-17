<?php

namespace App\Controller;

use Cake\Event\EventInterface;

class CategoriesController extends AppController
{

    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
        $this->slug = 'news';
    }


    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
        $this->viewBuilder()->setLayout("simple");
    }


    public function index()
    {
        $this->setList();
        $infos = $this->Cms->findAll($this->slug, ['limit' => '1']);
        $this->set(compact('infos'));
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
