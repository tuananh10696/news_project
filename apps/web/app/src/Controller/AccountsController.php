<?php

namespace App\Controller;

use App\Form\ContactForm;

class AccountsController extends AppController
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
        $this->set('slug', 'login');
        $this->loadModel('Accounts');

        if ($this->request->is('post')) {

            $data = $this->request->getData();
            $entity = $this->Accounts->newEntity($data, ['validate' => 'login']);

            if (empty($entity->getErrors())) {
                $login = $this->Accounts->find('all')->where(['Accounts.email' => $data['email'], 'status' => 'publish'])->first();

                // $face_image = $r->face_image ? $r->attaches['face_image']['s'] : '';
                if ($login) {
                    if ($data['password'] == @$login['password']) {
                        $this->Session->write([
                            'user_data' => [
                                'name' => $login['username'],
                                'user_role' => $login['role'],
                                // 'face_image' => $face_image
                            ],
                        ]);
                        return $this->redirect('/');
                    } else {
                        $this->set('err', 'Sorry, Mật khẩu không đúng.');
                    }
                } else {
                    $this->set('err', 'Sorry, Email không đúng.');
                }
            }
        }
    }


    public function register($id = 0)
    {
        $list = $this->setLists();
        $this->set('slug', 'login');
        $this->loadModel('Accounts');
        $contact_form = new ContactForm();

        if ($this->request->is('post')) {
            $data = $this->request->getData();

            $entity = $this->Accounts->newEntity($data);
            // dd($entity->getErrors()); 
            if (empty($entity->getErrors())) {
                $contact_form->_sendmail($data);
                $saved = $this->Accounts->save($entity);

                if ($saved) {
                    // $this->Session->write(['is_login' => true]);
                    return $this->redirect(['action' => 'index']);
                }
            }
            $this->set('err', $entity->getErrors());
            // $this->set('err', ['custom' => 'Có lỗi xảy ra , vui lòng đăng kí lại.']);
        }
    }

    public function logout()
    {
        $this->Session->delete('user_data');
        return $this->redirect('/');
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
