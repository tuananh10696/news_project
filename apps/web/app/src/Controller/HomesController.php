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
        // $this->setLists();
        // $news = $this->Cms->findAll(NEWS, ['limit' => 1]);
        // $column = $this->Cms->findAll(COLUMN, ['limit' => 3]);
        // $this->set(compact(NEWS, COLUMN));
    }

    public function setLists()
    {
        $list = ['body_class' => 'page-home'];
        $list['cat_color'] = ['インタビュー' => '', 'イベントレポート' => 'label--clr02', '情報記事' => 'label--clr03'];
        if (!empty($list)) $this->set(array_keys($list), $list);
        return $list;
    }
}
