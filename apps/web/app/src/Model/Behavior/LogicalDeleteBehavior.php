<?php

namespace App\Model\Behavior;

use ArrayObject;
use Cake\Event\Event;
use Cake\ORM\Behavior;
use Cake\ORM\Query;

class LogicalDeleteBehavior extends Behavior
{

    protected $_defaultConfig = array();
    public $include_flag = false;


    public function initialize(array $config)
    {
        $Model = $this->getTable();
        $this->settings[$Model->getAlias()] = $config + $this->_defaultConfig;
    }


    public function beforeFind(Event $event, Query $query, ArrayObject $options, $primary)
    {
        $table = $event->getSubject();
        $Model = $table->getAlias();

        if ($this->include_flag === false) {
            $query->where([$Model . '.deleted !=' => 1]);
        }

        return $query;
    }


    public function findIncludeDelete(Query $query, array $options = [])
    {
        $this->include_flag = true;
        return $query;
    }
}
