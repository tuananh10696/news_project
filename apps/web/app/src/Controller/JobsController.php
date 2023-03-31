<?php

namespace App\Controller;

use App\Controller\AppController;
use Cake\Event\EventInterface;

class JOBSController extends AppController
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

        //job type
        $search_type_job = $this->request->getQuery('type');
        $search_type_job = $search_type_job == 'tim_viec' ? 0 : 1;

        //category sort
        $category_id = $this->request->getQuery('category_id') ?? 0;
        $search_kw = $this->request->getQuery('kw') ?? 0;
        $cat = $this->loadModel('Categories')
            ->find()
            ->where([
                'Categories.id' => intval($category_id),
                'Categories.status' => 'publish',
                'PageConfigs.slug' => JOBS,
            ])
            ->contain(['PageConfigs'])
            ->first();
        $category_id = $cat ? $cat->id : 0;
        $this->set('category_id', intval($category_id));

        $opts = [
            'limit' => 5,
            'append_cond' => ['job_type' => $search_type_job],
            'paginate' => true
        ];
        if ($category_id) $opts['append_cond'] = ['category_id' => $category_id];

        $infos = $this->Cms->findAll(JOBS, $opts);
        $this->set(compact('infos', 'category_id', 'search_type_job'));
        if ($search_type_job == 1){
            $this->render('search_people');
        } 
        $this->setHeadTitle('Tìm Việc Tại Genki-Vn');
    }

    public function people()
    { }

    public function detail($id = null)
    {
        $list = $this->setLists();
        $options = ['limit' => 10];
        $cat_all = $this->loadModel('Categories');
        $cat_all->id = 0;
        $cat_all->name = 'ALL';
        $cat_all->infos = $this->Cms->findAll(JOBS, $options);

        $jobs_all_data = array_map(function ($e) use ($options) {
            $options['append_cond']['category_id'] = $e->id;
            $e->infos = $this->Cms->findAll(JOBS, $options)->toArray();
            return $e;
        }, $list['category']);
        array_unshift($jobs_all_data, $cat_all);


        $info_array = $this->Cms->findFirst(JOBS, $id);

        //update view
        $info_table = $this->loadModel('Infos');
        $info_table->updateAll(['view' => intval($info_array['info']->view) + 1], ['Infos.id' => $id]);

        if (is_null($info_array)) return $this->redirect(['action' => 'index']);
        $info = $info_array['info'] ?? [];
        extract($info_array);


        $this->set(compact('contents', 'info', 'jobs_all_data'));
        $this->setHeadTitle($info->title);
        $this->set('__description__', $info->title);
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

        $list = ['prefecture_list' => $this->getPrefectureList()];

        $list['all_jobs'] = $this->Cms->findAll(JOBS, $opts);
        $list['opt_trending'] = $this->Cms->findAll(JOBS, $opt_trending);
        $list['opt_popular'] = $this->Cms->findAll(JOBS, $opt_popular);

        $list['category'] = $this->loadModel('Categories')
            ->find('all')
            ->where([
                'Categories.status' => 'publish',
                'PageConfigs.slug' => JOBS
            ])
            ->contain('PageConfigs')
            ->toArray();

        if (!empty($list)) $this->set(array_keys($list), $list);
        return $list;
    }
}
