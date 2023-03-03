<?php

namespace App\View\Helper;

use Cake\View\Helper;
use Cake\View\View;
use App\Model\Entity\PageConfigItem;

class editFormHelper extends Helper
{
    public $helpers = ['Html', 'Form'];

    public $view;
    public $entity;
    public $page_config;

    public $_form = [];
    public $hidden_field = ['id', 'position', 'page_config_id', 'meta_keywords', 'postMode', 'MAX_FILE_SIZE', 'page_config_slug'];


    public $main = [];
    public $append_item = [];
    public $content = [];
    public $waku = false;

    public $max_file_size = (1024 * 1024 * 5);
    public $post_mode = 'save';
    public $form_config = ['type' => 'file', 'context' => ['validator' => 'default'], 'name' => 'fm'];


    public function __construct(View $view, $config = [])
    {
        parent::__construct($view, $config);
        $this->view = $this->getView();

        $this->page_config = $this->view->get('page_config');
        $this->entity = $this->view->get('entity');

        $this->main = $this->view->get('_main');
        $this->append_item = $this->view->get('_appendItem');
        $this->content = $this->view->get('_content');
        $this->waku = $this->view->get('_waku');
    }


    public function setMain()
    {
        $default_page_config_item = new PageConfigItem;
        $default_page_config_item->setSource('PageConfigItems');
        $default_page_config_item->parts_type = 'main';
        $default_page_config_item->title = '';
        $default_page_config_item->sub_title = '';
        $default_page_config_item->status = 'Y';
        $default_page_config_item->is_required = 1;
        $default_page_config_item->editable_role = 'staff';
        $default_page_config_item->viewable_role = 'staff';

        $default =  $default_page_config_item;

        $status = false;
        $datetime = false;

        foreach ($this->main as $item) {
            // if ($item->status != 'Y') continue;
            if ($item->item_key == 'status') $status = true;
            if ($item->item_key == 'start_datetime') $datetime = true;
        }

        if (!$status) {
            $status = clone $default;
            $status->item_type = 'radio';
            $status->item_key = 'status';
            $status->title = '記事表示';
            $status->sub_title = '一覧に表示';
            $status->is_required = 1;
            array_splice($this->main, 0, 0, [$status]);
        }

        if (!$datetime) {
            $datetime = clone $default;
            $datetime->item_type = 'date';
            $datetime->item_key = 'start_datetime';
            $datetime->title = '掲載日';
            $datetime->is_required = 1;
            array_splice($this->main, 0, 0, [$datetime]);
        }

        $no = clone $default;
        $no->title = '記事番号';
        $no->item_type = 'label';
        $no->item_key = 'no';

        array_splice($this->main, 0, 0, [$no]);

        unset($default, $status, $datetime);

        return $this;
    }


    public function setHiddenField($array_field)
    {
        $this->hidden_field = $array_field;
        return $this;
    }


    public function setFormConfig($config)
    {
        $this->form_config = $config;
        return $this;
    }


    public function setPostMode($value)
    {
        $this->post_mode = $value;
        return $this;
    }


    public function setMaxFileSize($size)
    {
        $this->max_file_size = $size;
        return $this;
    }


    public function setTemplateName($name)
    {
        $this->template_name = $name;
        return $this;
    }


    public function getTemplateName()
    {
        return $this->template_name;
    }


    public function setConfigBlock($config)
    {
        return $this;
    }


    public function createForm()
    {
        // フォーム開始
        $this->_form = [$this->Form->create($this->entity, $this->form_config)];

        $this
            ->createInputHidden()
            ->createDiv(['class' => 'table_edit_area'])

            // メンItemとAppend Itemを混ぜてフォームに追加
            ->mergeMainAndAppendItem()
            ->createMain()
            // END・メンItemとAppend Itemを混ぜてフォームに追加

            ->closeDiv()

            // Block追加ボタン
            ->createBlock()

            // Submitボタン
            ->createButton();

        return $this;
    }


    public function createBlock()
    {
        if (!empty($this->content))
            $this
                ->createDiv(['class' => 'editor__table mb-4'])
                ->renderCurrentBlock()
                ->addBlockBtn()
                ->buildDialogAddBlock()
                ->closeDiv();

        return $this;
    }


    public function renderCurrentBlock()
    {
        $this
            ->createDiv(['class' => 'table__body list_table ui-sortable pb-2', 'id' => 'blockArea'])
            ->renderBlock()
            ->closeDiv();

        return $this;
    }


    public function renderBlock()
    {
        array_push($this->_form, $this->getView()->element(__('Block/block_content')));
        return $this;
    }


    public function buildDialogAddBlock()
    {
        array_push($this->_form, $this->getView()->element(__('Block/dialog_content'), ['is_waku' => $this->waku]));
        return $this;
    }


    public function addBlockBtn()
    {
        array_push($this->_form, $this->getView()->element(__('Block/add_block_button')));
        return $this;
    }


    public function createButton()
    {
        array_push($this->_form, $this->getView()->element(__('Block/edit_button')));
        return $this;
    }



    public function closeDiv()
    {
        array_push($this->_form, '</div>');
        return $this;
    }


    public function createDiv($options = [])
    {
        $div = __('<div {0}>', implode('', array_map(function ($k, $v) {
            return __('{0}="{1}"', $k, $v);
        }, array_keys($options), array_values($options))));

        array_push($this->_form, $div);
        return $this;
    }


    public function mergeMainAndAppendItem()
    {
        foreach ($this->append_item as $aitem) {

            $main_item = [];
            $is_insert = false;

            foreach ($this->main as $mitem) {
                $main_item[] = $mitem;

                if ($mitem->parts_type == 'main' && $mitem->item_key == $aitem->after_field) {
                    $main_item[] = $aitem;
                    $is_insert = true;
                }
            }

            if (!$is_insert) $main_item[] = $aitem;

            $this->main = $main_item;
        }

        return $this;
    }


    public function createMain()
    {
        $count_append = 0;
        foreach ($this->main as $item) {
            if ($item->parts_type == 'main' && $item->status != 'Y') continue;

            $is_main = $item->getSource() == 'PageConfigItems';
            $sub_path = $is_main ? $item->parts_type : 'append';
            $slug = @$item->page_config->slug ? __('/{0}', $item->page_config->slug) : '';
            $element = $is_main ? $item->item_key : $item->slug;

            array_push($this->_form, $this->getView()->element(__('Block/{0}{1}/{2}', $sub_path, $slug, $element), ['content' => $item, 'num' => $count_append]));

            if (!$is_main) $count_append++;
        }

        return $this;
    }


    public function createInputHidden()
    {
        $options = [
            'MAX_FILE_SIZE' => $this->max_file_size,
            'postMode' => $this->post_mode,
            'page_config_id' => $this->page_config->id,
            'page_config_slug' => $this->page_config->slug
        ];

        foreach ($this->hidden_field as $inp) {
            $opts = isset($options[$inp]) ? ['value' => $options[$inp]] : [];
            array_push($this->_form, $this->Form->hidden($inp, $opts));
        }
        return $this;
    }


    public function render()
    {
        $this->setMain()->createForm();
        $this->createDiv(['id' => 'deleteArea', 'class' => 'dpl_none'])->closeDiv();
        array_push($this->_form, $this->Form->end());
        return implode('', $this->_form);
    }
}
