<div class="table__row first-dir" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="table__column table__column-sub table-op">
			<span class="ad-blog-text" ><?= (h($rownum) + 1); ?>.<?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$content['block_type']]; ?></span>
			<div class="table-op-icon">
				<?= $this->element('Block/sort_handle'); ?>
				<?= $this->element('Block/block_options', ['rownum' => $rownum, 'disable_config' => true]); ?>
			</div>
		</div>
		<div class="block_header">
			<?= $this->Form->input("info_contents.{$rownum}.id", ['type' => 'hidden', 'value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.position", ['type' => 'hidden', 'value' => h($content['position'])]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.block_type", ['type' => 'hidden', 'value' => h($content['block_type']), 'class' => 'block_type']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.section_sequence_id", ['type' => 'hidden', 'value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
			<?= $this->Form->input("info_contents.{$rownum}._block_no", ['type' => 'hidden', 'value' => h($rownum)]); ?>
		</div>
		<div class="block_content">
			<?= $this->Form->input("info_contents.{$rownum}.h2", [
				'type' => 'text',
				'style' => 'width: 100%;min-height: 50px;',
				'class' => 'h2_title form-control',
				'maxlength' => 100,
				'placeholder' => '大タイトルを入力してください'
			]); ?>
		</div>
	</div>
</div>