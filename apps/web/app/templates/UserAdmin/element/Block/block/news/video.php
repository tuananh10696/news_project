<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<div class="block_header">
			<?= $this->Form->input("info_contents.{$rownum}.id", ['type' => 'hidden', 'value' => @$content['id'], 'id' => "idBlockId_" . h($rownum)]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.position", ['type' => 'hidden', 'value' => h($content['position'])]); ?>
			<?= $this->Form->input("info_contents.{$rownum}.block_type", ['type' => 'hidden', 'value' => h($content['block_type']), 'class' => 'block_type']); ?>
			<?= $this->Form->input("info_contents.{$rownum}.section_sequence_id", ['type' => 'hidden', 'value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
			<?= $this->Form->input("info_contents.{$rownum}._block_no", ['type' => 'hidden', 'value' => h($rownum)]); ?>
		</div>
		<div class="block_content group-video">
			<div class="row">
				<div class="col">

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">
								<label class="m-0">
									<?= $this->Form->input("info_contents.{$rownum}.option_value2", [
										'type' => 'checkbox',
										'value' => 1,
										'class' => 'mr-2 is_url',
										'onchange' => 'detectVideo(this)',
									]); ?>
									URL
								</label>
							</span>
						</div>

						<?= $this->Form->input("info_contents.{$rownum}.content", [
							'type' => 'text',
							'class' => 'form-control input-video',
							'maxlength' => 200,
							'placeholder' => '動画のURL、又は動画のID',
							'onchange' => 'detectVideo(this)',
						]); ?>

						<div class="input-group-prepend">
							<?= $this->Form->select("info_contents.{$rownum}.option_value3", ['youtube' => 'Youtube'], ['class' => 'form-control video-type', 'onchange' => 'detectVideo(this)']); ?>
						</div>
					</div>
				</div>

			</div>
			<div class="row mt-1">
				<div class="col-3"></div>
				<div class="col-5 yt<?= @$content['content'] != '' ? '' : ' dpl_none' ?>">

					<?php if ($content['option_value3'] === 'youtube') : ?>

						<?php $id = getIDofYTfromURL($content['content']); ?>
						<?php $src = __('https://www.youtube.com/embed/{0}', intval($content['option_value2']) == 1 ? $id : $content['content']); ?>
						<iframe width="560" height="315" src="<?= $src ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

					<?php else : ?>

						<?php $id = getIDofVimeofromURL($content['content']); ?>
						<?php $src = __('https://player.vimeo.com/video/{0}', intval($content['option_value2']) == 1 ? $id : $content['content']); ?>
						<iframe src="<?= $src ?>" width="560" height="315" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
					<?php endif; ?>

				</div>
			</div>
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