<?php

namespace App\Controller;

class NewsController extends AppController
{


    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
        $this->setHeadTitle('お知らせ');
    }


    public function index()
    {
        $this->setLists();

        //category sort
        $category_id = $this->request->getQuery('category_id') ?? 0;
        $search_kw = $this->request->getQuery('kw') ?? 0;
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

        $opts = [
            'limit' => 5,
            'paginate' => true
        ];
        if ($category_id) $opts['append_cond'] = ['category_id' => $category_id];
        if ($search_kw) $opts['append_cond'] = ['value_text' => $search_kw];

        // dd($opts);
        $infos = $this->Cms->findAll(NEWS, $opts);
        $this->set(compact('infos','category_id'));
    }


    public function detail($id = null)
    {
        $list = $this->setLists();
        $options = ['limit' => 10];
        $cat_all = $this->loadModel('Categories');
        $cat_all->id = 0;
        $cat_all->name = 'ALL';
        $cat_all->infos = $this->Cms->findAll(NEWS, $options);

        $news_all_data = array_map(function ($e) use ($options) {
            $options['append_cond']['category_id'] = $e->id;
            $e->infos = $this->Cms->findAll(NEWS, $options)->toArray();
            return $e;
        }, $list['category']);
        array_unshift($news_all_data, $cat_all);


        $this->setLists();
        $info_array = $this->Cms->findFirst(NEWS, $id);
        if (is_null($info_array)) return $this->redirect(['action' => 'index']);
        $info = $info_array['info'] ?? [];
        extract($info_array);

        $this->set(compact('contents', 'info', 'news_all_data'));
        // $this->setHeadTitle($info->title);
        // $this->set('__description__', $info->meta_description);
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
