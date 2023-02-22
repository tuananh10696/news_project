<?php

namespace App\Model\Table;

use Cake\Validation\Validator;

class AppendItemsTable extends AppTable
{

    // テーブルの初期値を設定する
    public $defaultValues = [
        "id" => null,
        "position" => 0
    ];

    public $attaches = array(
        'images' =>
        array(),
        'files' => array(),
    );


    public function initialize(array $config): void
    {
        $this->setDisplayField('name');

        parent::initialize($config);

        // 添付ファイル
        // $this->addBehavior('FileAttache');
        $this->addBehavior('Position', [
            'group' => ['page_config_id'],
            'order' => 'DESC'
        ]);

        // アソシエーション
        $this->belongsTo('PageConfigs');
        $this->hasMany('InfoAppendItems')->setDependent(true);
        $this->hasMany('MstLists')
            ->setForeignKey('slug')
            ->setBindingKey('mst_list_slug');

        parent::initialize($config);
    }


    // Validation
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->allowEmpty('name');

        return $validator;
    }
}
