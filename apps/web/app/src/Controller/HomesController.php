<?php

namespace App\Controller;

class HomesController extends AppController
{


    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
    }

    public function index()
    {
        $this->setLists();

        //category sort
        $category_id = $this->request->getQuery('category_id') ?? 0;
        $cat = $this->loadModel('Categories')
            ->find()
            ->where([
                'Categories.id' => intval($category_id),
                'Categories.status' => 'publish',
                'PageConfigs.slug' => NEWS,
            ])
            ->contain(['PageConfigs'])
            ->first();
        $category_id = $cat ? $cat->id : 0;
        $this->set('category_id', intval($category_id));

        // Sidebar data
        $opts = [
            'limit' => 5,
            'paginate' => true
        ];
        $opt_trending = [
            'limit' => 5,
            'append_cond' => ['Infos.popular' => 1]
        ];
        $opt_popular = [
            'limit' => 5,
            'append_cond' => ['Infos.popular' => 2]
        ];

        if ($category_id) $opts['append_cond'] = ['category_id' => $category_id];

        $infos = $this->Cms->findAll(NEWS, $opts);
        $opt_trending = $this->Cms->findAll(NEWS, $opt_trending);
        $opt_popular = $this->Cms->findAll(NEWS, $opt_popular);

        // $this->set('category', $this->setLists());
        $this->set(compact('infos', 'opt_trending', 'opt_popular'));
    }

    public function setLists()
    {
        $list = [];

        $opts = [
            'limit' => 5,
            'paginate' => true
        ];
        $opt_trending = [
            'limit' => 5,
            'append_cond' => ['Infos.popular' => 1]
        ];
        $opt_popular = [
            'limit' => 5,
            'append_cond' => ['Infos.popular' => 2]
        ];


        $list['all_news'] = $this->Cms->findAll(NEWS, $opts);
        $list['opt_trending'] = $this->Cms->findAll(NEWS, $opt_trending);
        $list['opt_popular'] = $this->Cms->findAll(NEWS, $opt_popular);

        $list['category'] = $this->loadModel('Categories')
            ->find('all')
            ->where([
                'Categories.status' => 'publish',
                'PageConfigs.slug' => 'news'
            ])
            ->contain('PageConfigs')
            ->toArray();

        if (!empty($list)) $this->set(array_keys($list), $list);
        return $list;
    }
}
