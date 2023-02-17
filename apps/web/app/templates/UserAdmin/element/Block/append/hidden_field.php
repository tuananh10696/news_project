<?= $this->Form->hidden("info_append_items.{$num}.id") ?>
<?= $this->Form->hidden("info_append_items.{$num}.append_item_id", ['value' => @$append_list[$num]->id]); ?>