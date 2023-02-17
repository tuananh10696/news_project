<?php

namespace App\Model\Table;

class SectionSequencesTable extends AppTable
{

    // テーブルの初期値を設定する
    public $defaultValues = [
        "id" => null
    ];

    public $attaches = [
        'images' => [],
        'files' => [],
    ];


    public function initialize(array $config): void
    {
        $this->hasMany('UserInfoContents')
            ->setDependent(true);
        parent::initialize($config);
    }


    public function createNumber()
    {
        $entity = $this->createEntity();
        $this->save($entity);
        return $entity->id;
    }
}
