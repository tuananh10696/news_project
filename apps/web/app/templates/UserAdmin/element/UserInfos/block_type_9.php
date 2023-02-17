<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="block_header">
			<?= $this->Form->input("info_contents.{$rownum}.id", ['type' => 'hidden', 'value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.position", ['type' => 'hidden', 'value' => h($content['position'])]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.block_type", ['type' => 'hidden', 'value' => h($content['block_type']), 'class' => 'block_type']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.title", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.content", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.image", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.image_pos", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.file", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.file_size", ['type' => 'hidden', 'value' => '0']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.file_name", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.section_sequence_id", ['type' => 'hidden', 'value' => h($content['section_sequence_id']),  'class' => 'section_no']); ?>
			<?= $this->Form->input("info_contents.{$rownum}._block_no", ['type' => 'hidden', 'value' => h($rownum)]); ?>
		</div>
		<div class="block_content">
			<hr class="style_target">
		</div>
	</div>

	<div class="table__column table__column-sub">
		<span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.区切り線</span>
		<div class="table__row-config">
			<?= $this->element('UserInfos/sort_handle2'); ?>
			<?= $this->element('UserInfos/item_block_buttons', ['rownum' => $rownum, 'disable_config' => true]); ?>
		</div>
	</div>
</div>