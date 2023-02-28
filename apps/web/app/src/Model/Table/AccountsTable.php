<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use Cake\ORM\TableRegistry;

class AccountsTable extends AppTable
{
    public function initialize(array $config): void
    {
        $this->addBehavior('FileAttache');
        parent::initialize($config);
    }

    // Validation
    public function validationLogin(Validator $validator)
    {
        // $validator = $this->validationDefault($validator);
        $validator
            ->notEmpty('email', 'Vui lòng nhập email.')
            ->add('email', 'maxLength', [
                'rule' => ['maxLength', 200],
                'message' => __('200 chữ thôi bạn nhé.')
            ])
            ->notEmpty('password', 'Vui lòng nhập email.')
            ->add('password', 'maxLength', [
                'rule' => ['maxLength', 100],
                'message' => __('100 chữ thôi bạn nhé.')
            ]);
        return $validator;
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator->setProvider('Accounts', 'App\Validator\AccountValidation');

        $validator
            ->notEmpty('username', 'Vui lòng nhập tên tài khoản.')
            ->add('username', 'chkUserName', [
                'rule' => ['checkUsername'],
                'provider' => 'Accounts',
                'message' => 'Tên tài khoản có kí tự đặc biệt.'
            ])
            ->add('username', 'Length', [
                'rule' => ['lengthBetween', 3, 30],
                'message' => 'Tên tài khoản từ 3 đến 30 kí tự.'
            ])
            // ->add('username', 'unique', [
            //     'rule' => ['isUnique'],
            //     'provider' => 'Accounts',
            //     'message' => 'Tên tài khoản đã được sử dụng.'
            // ])

            ->notEmpty('password', 'Vui lòng nhập mật khẩu.')
            ->add('password', 'Length', [
                'rule' => ['lengthBetween', 8, 32],
                'message' => 'Tên tài khoản từ 8 đến 32 kí tự.'
            ])
            ->notEmpty('confirm_password', 'Vui lòng nhập lại mật khẩu.')
            ->add('confirm_password', 'Length', [
                'rule' => ['lengthBetween', 8, 32],
                'message' => 'Tên tài khoản từ 8 đến 32 kí tự.'
            ])

            ->notEmpty('email', 'Vui lòng nhập email.')
            ->add('email', 'maxLength', [
                'rule' => ['maxLength', 200],
                'message' => __('200 chữ thôi bạn nhé.')
            ])
            ->add('email', 'custom', [
                'rule' => ['isUnique'],
                'provider' => 'Accounts',
                'message' => 'Email này đã được sử dụng.'
            ]);

        return $validator;
    }
}
