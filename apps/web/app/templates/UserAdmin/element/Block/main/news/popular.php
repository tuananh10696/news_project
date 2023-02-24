<?php
$is_main = $content->getSource() == 'PageConfigItems'; // main or append_item

$title = $is_main ? $content->title : $content->name;
$sub_title = $is_main ? $content->sub_title : $content->attention;
$item_key = $is_main ? $content->item_key : __('info_append_items.{0}.{1}', $num, $content->slug);
?>

<div class="form-group row">

    <label for="" class="col-12 col-md-3 col-form-label control_title">
        <?= $title != '' ? $title : 'Radio型' ?>
        <?= $sub_title != '' ? __('<small>（{0}）</small>', $sub_title) : '' ?>
        <?= $content->is_required ? __('<span class="attent">※必須</span>') : '' ?>
    </label>

    <div class="col-12 col-md-9 control_value">

        <?php if (!$is_main) : ?>
            <?= $this->element('/Block/append/hidden_field', ['num' => $num]) ?>
        <?php endif ?>

        <?php $options = ['All', 'Trending', 'Popular']; ?>

        <?= $this->Form->input($item_key, [
            'type' => 'radio',
            'value' => @$data['popular'] != '' ? $data['popular'] : 0,
            'options' => $options,
            'hiddenField' => false
        ]); ?>
    </div>
</div>