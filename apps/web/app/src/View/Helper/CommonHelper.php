<?php

namespace App\View\Helper;

use App\Model\Entity\Useradmin;
use App\Lib\Util;
use Cake\ORM\TableRegistry;
use Cake\View\View;


class CommonHelper extends AppHelper
{
    public function __construct(View $view, $options = [])
    {
        parent::__construct($view, $options);
        $registry = TableRegistry::getTableLocator();

        $this->PageConfigItems = $registry->get('PageConfigItems');
        $this->PageConfigs = $registry->get('PageConfigs');
        $this->InfoAppendItems = $registry->get('InfoAppendItems');
        $this->Infos = $registry->get('Infos');
    }


    public function getCategoryEnabled()
    {
        return CATEGORY_FUNCTION_ENABLED;
    }


    public function getCategorySortEnabled()
    {
        return CATEGORY_SORT;
    }


    public function isCategoryEnabled($page_config, $mode = 'category')
    {

        if (!$this->getCategoryEnabled()) {
            return false;
        }

        if (empty($page_config)) {
            return false;
        }

        $mode = 'is_' . $mode;
        if ($page_config->{$mode} === 'Y' || strval($page_config->{$mode}) === '1') {
            return true;
        }

        return false;
    }


    public function isCategorySort($page_config_id)
    {

        if (!CATEGORY_SORT) {
            return false;
        }
        $page_config = $this->PageConfigs->find()->where(['PageConfigs.id' => $page_config_id])->first();

        if (empty($page_config)) {
            return false;
        }

        if ($page_config->is_category_sort == 'Y') {
            return true;
        }

        return false;
    }


    public function isViewSort($page_config, $category_id = 0)
    {

        if ($page_config->disable_position_order == 1) {
            return false;
        }

        if (
            $this->getCategoryEnabled() && $page_config->is_category === 'Y'
            && ($this->isCategorySort($page_config->id)) || (!$this->isCategorySort($page_config->id) && !$category_id)
        ) {
            return true;
        }

        return false;
    }


    public function isViewPreviewBtn($page_config)
    {
        if ($page_config->disable_preview) {
            return false;
        }

        return true;
    }


    public function isUserRole($role_key, $isOnly = false)
    {

        $role = $this->session_read('user_role');

        if (intval($role) === 0) {
            $res = 'develop';
        } elseif ($role < 10) {
            $res = 'admin';
        } elseif ($role < 20) {
            $res = 'staff';
        } elseif ($role < 30) {
            $res = 'shop';
        } elseif ($role == 80) {
            $res = 'user_regist';
        } else if ($role >= 90) {
            $res = 'demo';
        }
        /** 必要に応じて追加 */
        else {
            $res = 'staff';
        }

        if (!$isOnly) {
            if ($role_key == 'admin') {
                $role_key = array('develop', 'admin');
            } elseif ($role_key == 'staff') {
                $role_key = array('develop', 'admin', 'staff');
            } elseif ($role_key == 'shop') {
                $role_key = array('develop', 'admin', 'staff', 'shop');
            } elseif ($role_key == 'user_regist') {
                $role_key = array('develop', 'admin', 'cms', 'shop', 'user_regist');
            }
        }

        if (in_array($res, (array)$role_key)) {
            return true;
        } else {
            return false;
        }
    }


    public function checkUserPublisher()
    {
        return true;
    }


    public function session_read($key)
    {
        return $this->_View->getRequest()->getSession()->read($key);
    }


    public function getAdminMenu()
    {
        return $this->session_read('admin_menu.menu_list');
    }


    public function getAppendFields($info_id)
    {
        $this->modelFactory('Table', ['Cake\ORM\TableRegistry', 'get']);
        $this->loadModel('InfoAppendItems');

        $contain = [
            'AppendItems'
        ];
        $append_items = $this->InfoAppendItems->find()->where(['InfoAppendItems.info_id' => $info_id])->contain($contain)->all();
        if (empty($append_items)) {
            return [];
        }

        $result = [];
        foreach ($append_items as $item) {
            // $_data = $item;
            $result[$item->append_item->slug] = $item;
        }

        return $result;
    }


    public function enabledInfoItem($page_id, $type, $key)
    {
        return $this->PageConfigItems->enabled($page_id, $type, $key);
    }


    public function infoItemTitle($page_id, $type, $key, $col = 'title', $default = '')
    {

        $title = '';
        if ($col == 'title') {
            $title = $this->PageConfigItems->getTitle($page_id, $type, $key, $default);
        } elseif ($col == 'sub_title') {
            $title = $this->PageConfigItems->getSubTitle($page_id, $type, $key, $default);
        } elseif ($col == 'memo') {
            $title = $this->PageConfigItems->getMemo($page_id, $type, $key, $default);
        }

        if (empty($title)) {
            $title = $default;
        }
        return $title;
    }


    public function getInfoCategories($info_id, $result_type = 'entity', $options = [])
    {
        return $this->Infos->getCategories($info_id, $result_type, $options);
    }


    public function isSiteUserLogin()
    {
        return $this->session_read('site_user_id');
    }


    public function isSiteCustomerLogin()
    {
        return $this->session_read('site_customer_id');
    }


    public function isSiteLogin()
    {
        return ($this->isSiteUserLogin() || $this->isSiteCustomerLogin());
    }


    public function getSiteRole()
    {
        $role = 'nologin';

        if ($this->isSiteUserLogin()) {
            $role = 'user';
        } elseif ($this->isSiteCustomerLogin()) {
            $role = 'customer';
        }

        return $role;
    }


    public function getUserRole()
    {
        return $this->session_read('user_role');
    }


    public function getUserRoleKey()
    {
        $role = $this->getUserRole();

        $key = Useradmin::$role_key_list[$role];


        return $key;
    }


    public function isMemberLogin()
    {
        return $this->session_read('memberId');
    }


    public function getMemberData($col = '')
    {
        if (!$this->isMemberLogin()) {
            return '';
        }

        $data = $this->session_read('data');
        if (empty($col)) {
            return $data;
        }

        if (array_key_exists($col, $data)) {
            return $data[$col];
        }

        return '';
    }

    public function dateEmpty($value)
    {
        return Util::dateEmpty($value);
    }
}
