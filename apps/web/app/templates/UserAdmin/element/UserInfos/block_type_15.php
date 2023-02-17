<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<tr>
			<td>
				<div class="sort_handle"></div>
				<?= $this->Form->input("info_contents.{$rownum}.id", ['type' => 'hidden', 'value' => h($content['id']), 'id' => "idBlockId_" . h($rownum)]); ?>
				<?= $this->Form->input("info_contents.{$rownum}.position", ['type' => 'hidden', 'value' => h($content['position'])]); ?>
				<?= $this->Form->input("info_contents.{$rownum}.block_type", ['type' => 'hidden', 'value' => h($content['block_type']), 'class' => 'block_type']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.title", ['type' => 'hidden', 'value' => '']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.image_pos", ['type' => 'hidden', 'value' => '']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.file", ['type' => 'hidden', 'value' => '']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.file_size", ['type' => 'hidden', 'value' => '0']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.file_name", ['type' => 'hidden', 'value' => '']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.section_sequence_id", ['type' => 'hidden', 'value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
				<?= $this->Form->input("info_contents.{$rownum}._block_no", ['type' => 'hidden', 'value' => h($rownum)]); ?>
				<?= $this->Form->input("info_contents.{$rownum}.option_value2", ['type' => 'hidden', 'value' => '']); ?>
				<?= $this->Form->input("info_contents.{$rownum}.option_value3", ['type' => 'hidden', 'value' => '']); ?>
			</td>
			<td class="head"></td>
			<td>
				<dl>
					<dd>
						<?= $this->Form->input("info_contents.{$rownum}.content", ['type' => 'textarea', 'placeholder' => '※メモ内容', 'class' => 'form-control', 'maxlength' => 500]); ?>
						<div class="attention">※500文字以内</div>
					</dd>
				</dl>
			</td>
		</tr>
	</div>

	<div class="table__column table__column-sub">
		<span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.メモ</span>
		<div class="table__row-config">
			<?= $this->element('UserInfos/sort_handle2'); ?>
			<?= $this->element('UserInfos/item_block_buttons', ['rownum' => $rownum, 'disable_config' => true]); ?>
		</div>
	</div>
</div>