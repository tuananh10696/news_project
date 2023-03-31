<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="table__column table__column-sub table-op">
			<span class="ad-blog-text"><?= (h($rownum) + 1); ?>.<?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$content['block_type']]; ?></span>
			<div class="table-op-icon">
				<?= $this->element('Block/sort_handle'); ?>
				<?= $this->element('Block/block_options', ['rownum' => $rownum, 'disable_config' => true]); ?>
			</div>
		</div>
		<div class="block_header">
			<?= $this->Form->hidden("info_contents.{$rownum}.id", ['value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.position", ['value' => h($content['position'])]); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.block_type", ['value' => h($content['block_type']), 'class' => 'block_type']); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.section_sequence_id", ['value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}._block_no", ['value' => h($rownum)]); ?>
		</div>

		<div class="block_content">
			<div class="font_target">
				<?= $this->Form->input("info_contents.{$rownum}.content", [
					'type' => 'textarea',
					'class' => 'editor',
					'placeholder' => '']); ?>
			</div>
		</div>
	</div>
</div>