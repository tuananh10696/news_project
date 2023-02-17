<?php
$is_main = $content->getSource() == 'PageConfigItems'; // main or append_item

$title = $is_main ? $content->title : $content->name;
$sub_title = $is_main ? $content->sub_title : $content->attention;
$item_key = $is_main ? $content->item_key : __('info_append_items.{0}.{1}', $num, $content->slug);
$value = $is_main ? @$entity->attaches[$content->item_key][0] : @$entity->info_append_items[$num]->attaches[$content->slug][0];

$file_name = $is_main ?
    __('{0}.{1}', @$entity->file_name, @$entity->file_extension) :
    __('{0}.{1}', @$entity->info_append_items[$num]->file_name, @$entity->info_append_items[$num]->file_extension);

?>
<div class="form-group row">
    <label for="" class="col-12 col-md-3 col-form-label control_title">
        <?= $title != '' ? $title : 'File型' ?>
        <?= $sub_title != '' ? __('<small>（{0}）</small>', $sub_title) : '' ?>
        <?= $content->is_required ? __('<span class="attent">※必須</span>') : '' ?>
    </label>

    <div class="col-12 col-md-9 control_value td_parent">
        <?php if (!$is_main) : ?>
            <?= $this->element('/Block/append/hidden_field', ['num' => $num]) ?>
        <?php endif ?>

        <?php if (!$entity->isNew() && $value && $value != '') : ?>
            <div class="row">
                <div class="col-12">
                    <a href="<?= $value ?>" target="_blank"><?= $file_name ?></a>
                </div>
            </div>
        <?php endif ?>

        <?= $this->Form->input($item_key, ['type' => 'file', 'class' => 'attaches', 'accept' => '.doc, .docx, .xls, .xlsx, .pdf', 'onChange' => 'chooseFileUpload(this)', 'data-type' => 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,application/msword']); ?>
        <div class="attention">※PDF、Office(.doc, .docx, .xls, .xlsx)ファイルのみ</div>
        <div class="attention">※ファイルサイズ5MB以内</div>

        <?php if ($is_main && $content->is_required) : ?>
            <?= $this->Form->error("_file") ?>
        <?php endif ?>
    </div>
</div>