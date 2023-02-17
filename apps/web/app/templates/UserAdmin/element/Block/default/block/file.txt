<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="block_header">
			<?= $this->Form->hidden("info_contents.{$rownum}.id", ['value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.position", ['value' => h($content['position'])]); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.block_type", ['value' => h($content['block_type']), 'class' => 'block_type']); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}.section_sequence_id", ['value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
			<?= $this->Form->hidden("info_contents.{$rownum}._block_no", ['value' => h($rownum)]); ?>
		</div>

		<div class="block_content">
			<?php $_column = 'file'; ?>
			<ul>
				<?php if (!empty($content['attaches'][$_column]['0'])) : ?>
					<li class="<?= h($content['attaches'][$_column]['extention']); ?>">
						<div class="pb-2"><?= $this->Html->link(h($content['file_name'] . '.' . $content['file_extension']), $content['attaches'][$_column]['0'], array('target' => '_blank')) ?></div>
					</li>
				<?php endif; ?>

				<li class="td_parent">
					<?= $this->Form->input("info_contents.{$rownum}.file", array('type' => 'file', 'class' => 'attaches', 'accept' => '.doc, .docx, .xls, .xlsx, .pdf', 'onChange' => 'chooseFileUpload(this)', 'data-type' => 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel,application/msword')); ?>
					<div class="attention">※PDF、Office(.doc, .docx, .xls, .xlsx)ファイルのみ</div>
					<div class="attention">※ファイルサイズ5MB以内</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="table__column table__column-sub">
		<span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.<?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$content['block_type']]; ?></span>
		<div class="table__row-config">
			<?= $this->element('Block/sort_handle'); ?>
			<?= $this->element('Block/block_options', ['rownum' => $rownum, 'disable_config' => true]); ?>
		</div>
	</div>
</div>