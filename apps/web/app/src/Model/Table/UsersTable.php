<?php

namespace App\Model\Table;

use ArrayObject;
use Cake\Event\Event;
use Cake\Validation\Validator;
use Cake\Datasource\EntityInterface;
use Cake\Auth\DefaultPasswordHasher;

class UsersTable extends AppTable
{
    // テーブルの初期値を設定する
    public $defaultValues = [
        'id' => null
    ];

    public $attaches = [
        'images' => [],
        'files' => [],
    ];

    //
    // public function initialize(array $config)
    // {
    //     parent::initialize($config);
    // }


    // Validation
    public function validationDefault(Validator $validator)
    {

        $validator
            ->notEmptyString('name', 'アカウント名を入力してください')
            ->maxLength('name', 20, '20文字以内で入力してください')
            ->add('name', 'checkUnique', [
                'rule' => function ($value, $content) {
                    $id = isset($content['data']['id']) ? intval($content['data']['id']) : 0;

                    $value = preg_replace("/( |　)/", "", $value);
                    $cond = ['name' => trim($value)];

                    if ($id > 0) $cond['id !='] = $id;


                    $data = $this->find('all')->where($cond)->first();
                    return is_null($data) ? true : '既にあるアカウント名が登録されました';
                }
            ])


            ->notEmptyString('login_id', 'ユーザーIDを入力してください')
            ->lengthBetween('login_id', [6, 30], '6文字以上30文字以内で入力してください')
            ->add('login_id', 'checkRule', ['rule' => fn ($value, $content) => preg_match('/^[a-zA-Z0-9]+$/', trim($value)) ? true : '使えない文字が含まれています'])
            ->add('login_id', 'checkUnique', [
                'rule' => function ($value, $content) {
                    $id = isset($content['data']['id']) ? intval($content['data']['id']) : 0;

                    $value = preg_replace("/( |　)/", "", $value);
                    $cond = ['login_id' => trim($value)];

                    if ($id > 0) $cond['id !='] = $id;

                    $data = $this->find('all')->where($cond)->first();
                    return is_null($data) ? true : '既にあるユーザーIDが登録されました';
                }
            ])


            ->notEmptyString('pw', 'パスワードを入力してください')
            ->lengthBetween('pw', [6, 30], '6文字以上30文字以内で入力してください')
            ->add('pw', 'pw', ['rule' => fn ($value, $content) => preg_match('/^[a-zA-Z0-9]+$/', trim($value)) ? true : '使えない文字が含まれています'])
            ->add('pw', 'checkSame', [
                'rule' => function ($value, $content) {
                    $login_id = isset($content['data']['login_id']) ? $content['data']['login_id'] : '';
                    return trim($login_id) != trim($value) ? true : 'ユーザーIDと重複しています';
                }
            ]);

        return $validator;
    }



    // Validation
    public function validationLogin(Validator $validator)
    {

        $validator
            ->notEmptyString('login_id', 'ユーザーIDを入力してください')
            ->notEmptyString('pw', 'パスワードを入力してください');

        return $validator;
    }


    // public function beforeMarshal(Event $event, ArrayObject $data, ArrayObject $options)
    // {
    //     if (isset($data['pw']) && isset($data['id']) && preg_replace("/( |　)/", "", $data['pw']) == '' && intval($data['id']) != 0)
    //         unset($data['pw']);
    // }


    // public function beforeSave(Event $event, EntityInterface $entity, ArrayObject $options)
    // {

    //     if ($entity->pw) $entity->pw = (new DefaultPasswordHasher())->hash(trim($entity->pw));
    //     $entity->name = preg_replace("/( |　)/", "", $entity->name);
    //     $entity->login_id = preg_replace("/( |　)/", "", $entity->login_id);
    // }
}
