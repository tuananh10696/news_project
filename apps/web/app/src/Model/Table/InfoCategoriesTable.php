<?php

namespace App\Model\Table;

use Cake\Validation\Validator;

class InfoCategoriesTable extends AppTable
{

    // テーブルの初期値を設定する
    public $defaultValues = [
        "id" => null,
    ];

    public $attaches = array(
        'images' =>
        array(),
        'files' => array(),
    );
    // 推奨サイズ
    public $recommend_size_display = [
        // 'image' => true, //　編集画面に推奨サイズを常時する場合の指定
        // 'image' => ['width' => 700, 'height' => 300] // attaachesに書かれているサイズ以外の場合の指定
        // 'image' => false
        // 'image' => ''
    ];


    // 
    public function initialize(array $config): void
    {

        // // 並び順
        // $this->addBehavior('Position', [
        //     'group' => ['user_info_id'],
        //     'groupMove' => false,
        //     'order' => 'DESC'
        // ]);
        // 添付ファイル
        // $this->addBehavior('FileAttache');

        $this->belongsTo('Infos');
        $this->belongsTo('Categories');

        parent::initialize($config);
    }


    // Validation
    public function validationDefault(Validator $validator): Validator
    {
        $validator->setProvider('Info', 'App\Validator\InfoValidation');
        return $validator;
    }
}
