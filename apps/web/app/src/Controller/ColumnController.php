<?php

namespace App\Controller;

use App\Controller\AppController;


class ColumnController extends AppController
{


    public function beforeFilter(\Cake\Event\Event $event)
    {
        $this->loadComponent('Cms');

        $this->modelName = 'Infos';
        $this->{$this->modelName} = $this->getTableLocator()->get($this->modelName);
        $this->slug = COLUMN;
        parent::beforeFilter($event);
        $this->setHeadTitle('システム導入をお考えの方必見！クラウドシステムを利用する7つのメリットとはシステム導入をお考えの方必見！クラウドシステムを利用する7つのメリットとは');
        $this->set('__description__', 'クラウド（ASP/SaaS）型システムとは、ソフトウェアをインストール（所有）することなく、インターネット経由で利用できるシステムのことです。通常、IEやChrome、Firefoxなどのウェブブラウザでご使用いただけます。ここではそれらクラウドシステムを導入するメリットをご紹介いたします・・・・');
    }


    public function index()
    {
        $options = [
            'limit' => 8,
            'paginate' => true
        ];

        $this->set('infos', $this->Cms->findAll($this->slug, $options));
    }


    public function detail($id = null)
    {
        $info_array = $this->Cms->findFirst($this->slug, $id);
        if (is_null($info_array)) return $this->redirect(['action' => 'index']);
        $info = $info_array['info'] ?? [];
        extract($info_array);

        $this->set(compact('contents', 'info'));

        $options = [
            'limit' => 3,
            'paginate' => false,
            'append_cond' =>
            [
                'Infos.popular' => 1,
                'Infos.id !=' => $id
            ]
        ];

        $this->set('popular', $this->Cms->findAll($this->slug, $options));
    }
}
