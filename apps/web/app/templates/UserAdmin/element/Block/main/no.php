<div class="form-group row ">
    <label for="" class="col-12 col-md-3 col-form-label control_title">記事番号 </label>
    <div class="col-12 col-md-9 control_value "> <?= !$entity->isNew() ? sprintf('No. %04d', $entity->id) : "新規" ?> </div>
</div>