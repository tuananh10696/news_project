<div class="form-group row">
    <label for="" class="col-12 col-md-3 col-form-label control_title">
        <?= $content->title != '' ? $content->title : '記事表示' ?>
        <?= $content->sub_title != '' ? __('<small>（{0}）</small>', $content->sub_title) : '' ?>
        <?= $content->is_required ? __('<span class="attent">※必須</span>') : '' ?>
    </label>

    <div class="col-12 col-md-9 control_value">
        <?= $this->Form->input($content->item_key, [
            'type' => 'radio',
            'options' => ['publish' => '掲載する'],
            'hiddenField' => false,
            'templates' => [
                'radioWrapper' => '<div class="radio icheck-turquoise d-inline mr-2">{{label}}</div>',
            ]
        ]); ?>
        <?= $this->Form->input($content->item_key, [
            'type' => 'radio',
            'options' => ['draft' => '下書き'],
            'hiddenField' => false,
            'templates' => [
                'radioWrapper' => '<div class="radio icheck-danger d-inline mr-2">{{label}}</div>',
            ]
        ]); ?>
    </div>
</div>