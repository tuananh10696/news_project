<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="block_header">
			<?= $this->Form->input("many_img.{$rownum}.info_id", ['type' => 'hidden', 'value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->input("many_img.{$rownum}.page_config_id", ['type' => 'hidden', 'value' => '']); ?>
			<?= $this->Form->input("many_img.{$rownum}.info_content_id", ['type' => 'hidden', 'value' => '']); ?>
		</div>
		<div class="multiple-uploader" id="multiple-uploader">
			<div class="mup-msg">
				<span class="mup-main-msg">画像アップロードする。</span>
				<span class="mup-msg" id="max-upload-number">※最大6ファイル・ファイルサイズ5MB以内</span>
				<span class="mup-msg">※jpeg , jpg , gif , png ファイルのみ</span>
			</div>
		</div>
	</div>
	<div class="table__column table__column-sub">
		<span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.<?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$content['block_type']]; ?></span>
		<div class="table__row-config">
			<?= $this->element('Block/sort_handle'); ?>
			<?= $this->element('Block/block_options', ['rownum' => $rownum, 'disable_config' => false]); ?>
		</div>
	</div>
</div>