<?php
$is_main = $content->getSource() == 'PageConfigItems'; // main or append_item

$title = $is_main ? $content->title : $content->name;
$sub_title = $is_main ? $content->sub_title : $content->attention;
$item_key = $is_main ? $content->item_key : __('info_append_items.{0}.{1}', $num, $content->slug);
$value = $is_main ? @$entity->attaches[$content->item_key][0] : @$entity->info_append_items[$num]->attaches[$content->slug][0];

?>

<div class="form-group row">

    <label for="" class="col-12 col-md-3 col-form-label control_title">
        <?= $title != '' ? $title : '画像型' ?>
        <?= $sub_title != '' ? __('<small>（{0}）</small>', $sub_title) : '' ?>
        <?= $content->is_required ? __('<span class="attent">※必須</span>') : '' ?>
    </label>

    <?php if (!$is_main) : ?>
        <?= $this->element('/Block/append/hidden_field', ['num' => $num]) ?>
    <?php endif ?>

    <div class="col-12 col-md-9 control_value td_parent">

        <?php $image_column = $item_key ?>
        <?= $this->Form->input($image_column, ['type' => 'file', 'accept' => '.jpeg, .jpg, .gif, .png', 'onChange' => 'chooseFileUpload(this)', 'data-type' => 'image/jpeg,image/gif,image/png', 'class' => 'attaches']); ?>

        <?php if (!$entity->isNew() && $value && $value != '') : ?>
            <div class="thumbImg">
                <a href="<?= $value; ?>" class="pop_image_single">
                    <img src="<?= $this->Url->build($value) ?>" style="width: 300px;">
                </a>
                <?= $this->Form->input("_old_{$image_column}", ['type' => 'hidden', 'default' => $entity->$image_column, 'class' => 'old_img_input']); ?>
            </div>
        <?php endif; ?>

        <div class="preview_img dpl_none">
            <span class="preview_img_btn" onclick="preview_img_action(this)">画像の削除</span>
        </div>

        <div class="attention">※jpeg , jpg , gif , png ファイルのみ</div>
        <div class="attention"><?= $this->Form->getRecommendSize('Infos', 'image', ['before' => '※', 'after' => '']); ?></div>
        <div class="attention">※ファイルサイズ5MB以内</div>

        <?php if ($is_main && $content->is_required) : ?>
            <?= $this->Form->error("_image") ?>
        <?php endif ?>
    </div>
</div>