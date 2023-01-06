<?php

namespace App\Controller;

use Cake\Event\Event;

class HomesController extends AppController
{


    public function initialize()
    {
        parent::initialize();
        $this->loadComponent('Cms');
    }


    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
    }


    public function index()
    {
        $options = [
            'limit' => 6,
            'paginate' => false,
            'contain' => [
                'PageConfigs',
                'Categories',
                'InfoAppendItems'
            ]
        ];

        $this->set(CASESTUDY, $this->Cms->findAll(CASESTUDY, $options));
        $this->set(COLUMN, $this->Cms->findAll(COLUMN, $options));

        $options['limit'] = 3;
        $this->set(TOPICS, $this->Cms->findAll(TOPICS, $options));
    }
}
