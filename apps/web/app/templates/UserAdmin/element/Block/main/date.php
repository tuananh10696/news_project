<div class="form-group row ">
    <label for="" class="col-12 col-md-3 col-form-label control_title">
        <?= $content->title != '' ? $content->title : '掲載日' ?>
        <?= $content->sub_title != '' ? __('<small>（{0}）</small>', $content->sub_title) : '' ?>
        <?= $content->is_required ? __('<span class="attent">※必須</span>') : '' ?>
    </label>
    <div class="col-12 col-md-9 control_value">
        <div class="input-group">
            <div class="input-group-prepend">
                <?= $this->Form->input($content->item_key, ['type' => 'text', 'value' => ($entity->date ? $entity->date : (new DateTime('now')))->format('Y/m/d'), 'class' => '_datepicker form-control', 'readonly' => 'readonly', 'style' => 'width:100px;']) ?>
            </div>
        </div>
    </div>
</div>