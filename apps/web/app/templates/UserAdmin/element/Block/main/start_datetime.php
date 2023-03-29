<?php
$is_main = $content->getSource() == 'PageConfigItems'; // main or append_item
$item_key = $is_main ? $content->item_key : __('info_append_items.{0}.{1}', $num, $content->slug);
$value = $is_main ? $entity->{$content->item_key} : @$entity->info_append_items[$num]->{$content->slug};
?>

<div class="form-group row ">

    <label for="" class="col-12 col-md-3 col-form-label control_title">
        Post Time
    </label>

    <div class="col-12 col-md-9 control_value">

        <?php if (!$is_main) : ?>
            <?= $this->element('/Block/append/hidden_field', ['num' => $num]) ?>
        <?php endif ?>

        <div class="input-group" style="<?= !empty($this->request->getQuery('author')) && $this->request->getQuery('author') == 'user' ? 'pointer-events: none;' : '' ?>">
            <div class="input-group-prepend d-block">
                <?= $this->Form->input($item_key, ['type' => 'text', 'value' => ($value ?? new DateTime('now'))->format('Y/m/d H:i'), 'class' => 'datetimepicker form-control', 'readonly' => 'readonly', 'style' => 'width:150px;']) ?>
            </div>
        </div>
    </div>
</div>