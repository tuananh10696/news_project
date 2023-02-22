<?php

namespace App\Controller;

class ColumnController extends AppController
{


    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
        $this->setHeadTitle('コラム');
    }


    public function index()
    {
        $this->setLists();
        $category_id = $this->request->getQuery('category_id') ?? 0;

        $opts = [
            'limit' => 12,
            'paginate' => true
        ];

        if ($category_id)
            $opts['append_cond'] = ['category_id' => $category_id];

        $infos = $this->Cms->findAll(COLUMN, $opts);
        $this->set(compact('infos'));
    }


    public function detail($id = null)
    {
        $this->setLists();
        $info_array = $this->Cms->findFirst(COLUMN, $id);
        if (is_null($info_array)) return $this->redirect(['action' => 'index']);
        $info = $info_array['info'] ?? [];
        extract($info_array);

        $readmore = $this->Cms->findAll(COLUMN, ['limit' => 3, 'append_cond' => ['Infos.id !=' => $id]]);
        
        $this->set(compact('contents', 'info', 'readmore'));
        // $this->setHeadTitle($info->title);
        // $this->set('__description__', $info->meta_description);
    }


    public function setLists()
    {
        $list = ['body_class' => 'page-column'];
        $list['cat_color'] = ['orange' => 'label--clr03', 'olive' => 'label--clr02'];

        $category = $this->fetchTable('Categories')
            ->find()
            ->where([
                'PageConfigs.slug' => COLUMN,
                'Categories.status' => 'publish'
            ])
            ->contain(['PageConfigs', 'Infos' => function ($q) {
                return $q->where(['Infos.status' => 'publish']);
            }])
            ->toArray();

        $all = $this->fetchTable('Categories')
            ->newEmptyEntity();
        $all->id = 0;
        $all->name = 'すべて';
        $all->infos = $this->Cms->findAll(COLUMN)->toArray();

        $list['category'] = [$all, ...$category];

        if (!empty($list)) $this->set(array_keys($list), $list);
        return $list;
    }
}
