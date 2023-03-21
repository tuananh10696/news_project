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

        $opt_doi_song = [
            'limit' => 6,
            'append_cond' => ['Infos.category_id' => 1],
            'paginate' => false
        ];
        $opt_giai_tri = [
            'limit' => 4,
            'append_cond' => ['Infos.category_id' => 2],
            'paginate' => false
        ];
        $opt_hoc_tap = [
            'limit' => 4,
            'append_cond' => ['Infos.category_id' => 3],
            'paginate' => false
        ];
        $opt_kinh_nghiem = [
            'limit' => 6,
            'append_cond' => ['Infos.category_id' => 4],
            'paginate' => false
        ];

        $doi_song = $this->Cms->findAll(NEWS, $opt_doi_song);
        $giai_tri = $this->Cms->findAll(NEWS, $opt_giai_tri);
        $hoc_tap = $this->Cms->findAll(NEWS, $opt_hoc_tap);
        $kinh_nghiem = $this->Cms->findAll(NEWS, $opt_kinh_nghiem);
        $this->set(compact('doi_song', 'giai_tri', 'hoc_tap', 'kinh_nghiem'));
    }

    public function setLists()
    {
        $list = [];

        $opts = [
            'limit' => 6,
            'paginate' => false
        ];
        $opt_trending = [
            'limit' => 8,
            'append_cond' => ['Infos.popular' => 1]
        ];
        $opt_popular = [
            'limit' => 8,
        ];

        $top_slide = [
            'limit' => 8,
            'append_cond' => ['Infos.top_slide_display' => 1]
        ];


        $list['all_news'] = $this->Cms->findAll(NEWS, $opts);
        $list['opt_trending'] = $this->Cms->findAll(NEWS, $opt_trending);
        $list['opt_popular'] = $this->Cms->findAll(NEWS, $opt_popular);
        $list['top_slide'] = $this->Cms->findAll(NEWS, $top_slide);

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
