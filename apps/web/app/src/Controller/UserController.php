<?php

/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link      https://cakephp.org CakePHP(tm) Project
 * @since     0.2.9
 * @license   https://opensource.org/licenses/mit-license.php MIT License
 */

namespace App\Controller;

use Cake\Event\EventInterface;
use App\Controller\AppController;
use Cake\Auth\DefaultPasswordHasher;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class UserController extends AppController
{

    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('Cms');
        $this->slug = 'Users';
    }


    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
        // $this->viewBuilder()->setLayout(null);
    }
    public function login()
    {
        $this->viewBuilder()->setLayout(null);

        // // if (!$this->is_preview && (!$this->Session->check(['is_login']) || $this->Session->read(['is_login']) == false)) {

        //     $entity = $this->loadModel('Users');

        //     if ($this->request->is('post')) {
        //         $data = $this->request->getData();

        //         $entity = $this->Users->newEntity($data, ['validate' => 'login']);
        //         if (empty($entity->getErrors())) {
        //             $login = $this->Users->find('all')->where(['login_id' => $data['login_id'], 'status' => 'publish'])->first();

        //             if ($login) {

        //                 if ($data['password'] == $login->pw) {
        //                     $this->Session->write(['is_login' => true]);
        //                     return $this->redirect(['action' => 'index']);
        //                 }
        //             }
        //             $this->set('err', $err = 1);
        //         }
        //     }
        //     $this->set('entity', $entity);
        // // }

        // $options = [];
        // $data = $this->Cms->findAll('dedicated', $options);
        // $file = $this->Cms->findAll('file', $options);

        // $this->set(compact('data', 'file'));

        // $this->render('/');
    }

    public function logout()
    {

        $this->Session->delete('is_login');
        return $this->redirect(['action' => 'index']);
    }
}
