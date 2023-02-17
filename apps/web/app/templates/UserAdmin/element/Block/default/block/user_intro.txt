<div class="table__row first-dir item_block" id="block_no_<?= h($rownum); ?>" data-sub-block-move="1">
	<div class="table__column">
		<tr>
			<td>
				<div class="sort_handle"></div>
				<?= $this->Form->hidden("info_contents.{$rownum}.id", ['value' => h($content['id']), 'id' => "idBlockId_" . h($rownum)]); ?>
				<?= $this->Form->hidden("info_contents.{$rownum}.position", ['value' => h($content['position'])]); ?>
				<?= $this->Form->hidden("info_contents.{$rownum}.block_type", ['value' => h($content['block_type']), 'class' => 'block_type']); ?>
				<?= $this->Form->hidden("info_contents.{$rownum}.section_sequence_id", ['value' => h($content['section_sequence_id']), 'class' => 'section_no']); ?>
				<?= $this->Form->hidden("info_contents.{$rownum}._block_no", ['value' => h($rownum)]); ?>
			</td>
			<td class="head"></td>
			<td>
				<dl>
					<dd>
						<div class="card-body" style="border: 1px solid #cbcbcb;">
							<div class="row">
								<div class="col-3">
									<div class="text-center td_parent">

										<?= $this->Form->input("info_contents.{$rownum}.image", ['type' => 'file', 'id' => "__image{$rownum}", 'class' => 'attaches dpl_none', 'accept' => '.jpeg, .jpg, .png, .gif', 'onChange' => 'chooseFileUpload(this)', 'data-type' => 'image/jpeg,image/gif,image/png']); ?>

										<div class="preview_img t_align_c dpl_none w-100 avatar"></div>

										<?php if (!empty($content['attaches']['image']['0'])) : ?>
											<div class="thumbImg <?= $rownum ?>">
												<img class="mw-100 profile-user-img img-fluid img-circle" src="<?= $this->Url->build($content['attaches']['image']['0']) ?>" style="width: 120px; height: 120px;object-fit: cover;">
												<?= $this->Form->hidden("info_contents.{$rownum}._old_image", ['value' => h($content['image']), 'class ' => 'old_img_input']); ?>
											</div>
										<?php endif; ?>

										<div class="img_text t_align_c">
											<label type="button" class="btn btn-light edit__image-button" for="__image<?= $rownum ?>">
												<i class="fas fa-plus"></i>
												<i class="far fa-image"></i>
											</label>
											<div class="attention">※jpeg , jpg , gif , png ファイルのみ</div>
											<div class="attention">※ファイルサイズ5MB以内</div>
										</div>
									</div>
								</div>
								<div class="col-9">
									<div class="row mb-1">
										<div class="col-5">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">名前</span>
												</div>
												<?= $this->Form->input("info_contents.{$rownum}.title", ['type' => 'text', 'class' => 'form-control', 'maxlength' => 20]); ?>
											</div>
										</div>
									</div>
									<?= $this->Form->input("info_contents.{$rownum}.content", ['type' => 'textarea', 'placeholder' => '※内容', 'class' => 'form-control', 'maxlength' => 500]); ?>
									<div class="attention">※500文字以内</div>
								</div>
							</div>
						</div>
					</dd>
				</dl>
			</td>
		</tr>
	</div>

	<div class="table__column table__column-sub">
		<span style="font-size:0.9rem;"><?= (h($rownum) + 1); ?>.<?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$content['block_type']]; ?></span>
		<div class="table__row-config">
			<?= $this->element('Block/sort_handle'); ?>
			<?= $this->element('Block/block_options', ['rownum' => $rownum, 'disable_config' => true]); ?>
		</div>
	</div>
</div>