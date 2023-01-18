<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
  <div class="table__column">
    <div class="block_header">
      <?= $this->Form->input("info_contents.{$rownum}.id", ['type' => 'hidden', 'value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
      <?= $this->Form->input("info_contents.{$rownum}.position", ['type' => 'hidden', 'value' => h($content['position'])]); ?>
      <?= $this->Form->input("info_contents.{$rownum}.block_type", ['type' => 'hidden', 'value' => h($content['block_type']), 'class' => 'block_type']); ?>
      <?= $this->Form->input("info_contents.{$rownum}.section_sequence_id", ['type' => 'hidden', 'value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
      <?= $this->Form->input("info_contents.{$rownum}._block_no", ['type' => 'hidden', 'value' => h($rownum)]); ?>

      <?php echo $this->Form->input("info_contents.{$rownum}.option_value2", ['type' => 'hidden', 'value' => '']); ?>
    </div>

    <div class="block_title">

    </div>
    <div class="block_content">
      <div class="<?= h($content['option_value']); ?> font_target <?= h($content['option_value2']); ?>">
        <dt>1.タイトル</dt>
        <?= $this->Form->input("info_contents.{$rownum}.option_value2", [
          'type' => 'text',
          'class' => 'form-control'
        ]); ?>
      </div>
    </div>
    <div class="block_content">
      <div class="<?= h($content['option_value']); ?> font_target <?= h($content['option_value2']); ?>">
        </br>
        <dt>2.YOUTUBE URL</dt>
        <?= $this->Form->input("info_contents.{$rownum}.content", [
          'type' => 'text',
          'class' => 'form-control',
          'onchange' => "getVideoYT(this)"
        ]); ?>
      </div>
    </div>
  </div>
  <div class="yt">
    <?php $v = @$entity->info_contents[$rownum]->content;  ?>
    <?php $id = getIDofYTfromURL($v); ?>
    <?php $src = 'https://www.youtube.com/embed/' . $id; ?>
    <iframe width="560" height="315" src="<?= $src ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </div>
  <div class="table__column table__column-sub">
    <span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.YOUTUBE</span>
    <div class="table__row-config">
      <?= $this->element('UserInfos/sort_handle2'); ?>
      <?= $this->element('UserInfos/item_block_buttons', ['rownum' => $rownum, 'disable_config' => true]); ?>
    </div>
  </div>
</div>