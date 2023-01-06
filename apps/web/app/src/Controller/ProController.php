<?php

namespace App\Controller;

use App\Controller\AppController;


class ProController extends AppController
{


    public function beforeFilter(\Cake\Event\Event $event)
    {
        $this->loadComponent('Cms');

        $this->modelName = 'Infos';
        $this->{$this->modelName} = $this->getTableLocator()->get($this->modelName);
        $this->slug = CASESTUDY;
        parent::beforeFilter($event);
    }

    public function interview()
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

        $this->render('Interview/index');
    }


    public function detail($id = null)
    {
        $this->setHeadTitle('物流ソリューションを導入したお客様の声をご紹介');
        $this->set('__description__', 'アトムエンジニアリングには在庫管理システム、倉庫管理システムなど、多くの導入実績がございます。インタビュー形式でお客さまの声をご紹介いたします。');

        $opts['contain'] = [
            'Categories',
            'PageConfigs',
            'InfoAppendItems' => function ($q) {
                return $q->contain(['AppendItems'])->order(['AppendItems.position' => 'ASC']);
            },
            'InfoContents' => function ($q) {
                return $q->order(['InfoContents.position' => 'ASC'])
                    ->contain(['SectionSequences', 'MemberChat.Infos', 'MemberChat' => function ($q2) {
                        return $q2->where(['MemberInfos.status' => 'publish'])
                            ->contain(['MemberInfos']);
                    }]);
            },
            'ChildInfos' => function ($q) {
                return $q->where(['ChildInfos.status' => 'publish', 'PageConfigs.slug' => DISCUSSION_MEMBER])
                    ->contain(['InfoAppendItems', 'PageConfigs']);
            }
        ];

        if ($this->is_preview) {
            $opts['contain']['InfoContents'] = function ($q) {
                return $q->order(['InfoContents.position' => 'ASC'])
                    ->contain(['SectionSequences', 'MemberChat.Infos', 'MemberChat.MemberInfos']);
            };

            $opts['contain']['ChildInfos'] = function ($q) {
                return $q->where(['PageConfigs.slug' => DISCUSSION_MEMBER])->contain(['InfoAppendItems', 'PageConfigs']);
            };
        }

        $info_array = $this->Cms->findFirst($this->slug, $id, $opts);
        if (is_null($info_array)) return $this->redirect(['action' => 'interview']);

        $info = $info_array['info'] ?? [];

        $info_client = $this->Infos
            ->find()
            ->where([
                'Infos.parent_info_id' => $info->id,
                'PageConfigs.slug' => CLIENT,
            ])
            ->contain(
                ['PageConfigs', 'InfoAppendItems', 'InfoContents' => function ($q) {
                    return $q->order(['InfoContents.position' => 'ASC'])
                        ->contain(['SectionSequences']);
                }]
            )
            ->first();

        extract($info_array);

        $this->set(compact('contents', 'info', 'info_client'));
        $this->render('Interview/detail');
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
