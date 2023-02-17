<?php

namespace App\Model\Table;

use Cake\Validation\Validator;

class InfoTagsTable extends AppTable
{

    // テーブルの初期値を設定する
    public $defaultValues = [
        "id" => null
    ];

    public $attaches = array(
        'images' =>
        array(),
        'files' => array(),
    );

    // 
    public function initialize(array $config): void
    {
        $this->belongsTo('Infos')->setForeignKey('info_id');
        $this->belongsTo('Tags');

        parent::initialize($config);
    }


    // Validation
    public function validationDefault(Validator $validator): Validator
    {
        return $validator;
    }
}
