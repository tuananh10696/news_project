<?php

namespace App\Controller;

use App\Controller\AppController;


class NewsController extends AppController
{


    public function beforeFilter(\Cake\Event\Event $event)
    {
        $this->loadComponent('Cms');

        $this->modelName = 'Infos';
        $this->{$this->modelName} = $this->getTableLocator()->get($this->modelName);
        $this->slug = 'news';
        parent::beforeFilter($event);
    }

    public function index()
    {
        $this->setList();
        $this->setHeadTitle('物流ソリューションを導入したお客様の声をご紹介');
        $this->set('__description__', 'アトムエンジニアリングには在庫管理システム、倉庫管理システムなど、多くの導入実績がございます。インタビュー形式でお客さまの声をご紹介いたします。');

        $category_id = $this->request->getQuery('category_id');
        $this->set('category_id', $category_id ?? 0);

        $options = [
            'limit' => 10,
            'paginate' => true,
            'contain' => [
                'PageConfigs',
                'Categories',
                'InfoAppendItems'
            ]
        ];

        if ($category_id) $options['append_cond']['Categories.id'] = intval($category_id);

        $this->set('infos', $this->Cms->findAll($this->slug, $options));

    }


    public function detail($id = null)
    {
        $this->setHeadTitle('物流ソリューションを導入したお客様の声をご紹介');
        $this->set('__description__', 'アトムエンジニアリングには在庫管理システム、倉庫管理システムなど、多くの導入実績がございます。インタビュー形式でお客さまの声をご紹介いたします。');

        $opts['contain'] = [
            'Categories',
            'PageConfigs'];

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
