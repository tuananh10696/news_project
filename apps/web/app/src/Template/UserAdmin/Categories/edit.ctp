<?php

use App\Model\Entity\PageConfigItem;
?>

<?php $this->assign('content_title', "「{$page_config->page_title}」のカテゴリ"); ?>

<!-- breadcrumb -->
<?php $this->start('menu_list'); ?>
<li class="breadcrumb-item">
	<a href="<?= '/user_admin/infos/?sch_page_id=' . $page_config->id; ?>"><?= $page_config->page_title; ?></a>
</li>
<li class="breadcrumb-item">
	<a href="<?= '/user_admin/categories/?sch_page_id=' . $page_config->id; ?>">カテゴリ</a>
</li>
<li class="breadcrumb-item active">
	<span><?= ($data['id'] > 0) ? '編集' : '新規登録'; ?></span>
</li>
<?php $this->end(); ?>

<?php $this->start('content_header'); ?>
<h2 class="card-title"><?= ($data["id"] > 0) ? '編集' : '新規登録'; ?></h2>
<?php $this->end(); ?>

<?= $this->Form->create($entity, array('type' => 'file', 'context' => ['validator' => 'default'], 'name' => 'fm', 'templates' => $form_templates)); ?>

<?= $this->Form->input('id', array('type' => 'hidden', 'value' => $entity->id)); ?>
<?= $this->Form->input('position', array('type' => 'hidden')); ?>
<?= $this->Form->input('page_config_id', array('type' => 'hidden', 'value' => $query['sch_page_id'])); ?>

<div class="table_edit_area">

	<?php if ($page_config->is_category_multilevel == 1) : ?>
		<?= $this->element('edit_form/item-start', ['title' => '上層カテゴリ']); ?>
		<?php if (empty($parent_category)) : ?>
			（なし）
			<?= $this->Form->input('parent_category_id', ['type' => 'hidden', 'value' => 0]); ?>
		<?php else : ?>
			<?= $parent_category->name; ?>
			<?= $this->Form->input('parent_category_id', ['type' => 'hidden', 'value' => $query['parent_id']]); ?>
		<?php endif; ?>
		<?= $this->element('edit_form/item-end'); ?>
	<?php endif; ?>

	<?php if (!in_array($page_config->slug, [CASESTUDY], true)) : ?>
		<?= $this->element('edit_form/item-start', ['title' => '有効/無効']); ?>
		<?= $this->element('edit_form/item-status'); ?>
		<?= $this->element('edit_form/item-end'); ?>
	<?php endif ?>

	<?= $this->element('edit_form/item-start', ['title' => 'カテゴリ名', 'required' => true]); ?>
	<?= $this->Form->input('name', array('type' => 'text', 'maxlength' => 40, 'class' => 'form-control')); ?>
	<div class="attention">※40文字以内で入力してください</div>
	<?php if ($page_config->slug == CASESTUDY) : ?>
		<div class="attention"><?= h('※改行を使用したい場合、<br class="show_pc">を入力してください') ?></div>
	<?php endif ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?php if (in_array($page_config->slug, [CASESTUDY], true)) : ?>

		<?= $this->element('edit_form/item-start', ['title' => 'カテゴリ名（サブ）', 'required' => true]); ?>
		<?= $this->Form->input('identifier', array('type' => 'text', 'maxlength' => 30, 'class' => 'form-control')); ?>
		<div class="attention">※30文字以内で入力してください</div>
		<?= $this->element('edit_form/item-end'); ?>

		<?php $image_column = 'image'; ?>
		<?= $this->element('edit_form/item-start', ['title' => '画像', 'required' => true]); ?>
		<div class="edit_image_area td_parent">
			<ul>
				<li>
					<?= $this->Form->input($image_column, array('type' => 'file', 'accept' => '.jpeg, .jpg, .gif, .png', 'onChange' => 'chooseFileUpload(this)', 'data-type' => 'image/jpeg,image/gif,image/png', 'class' => 'attaches')); ?>
					<?php if (!empty($data['attaches'][$image_column]['0'])) : ?>
						<div class="thumbImg">
							<a href="<?= $data['attaches'][$image_column]['0']; ?>" class="pop_image_single">
								<img src="<?= $this->Url->build($data['attaches'][$image_column]['0']) ?>" style="width: 300px;">
								<?= $this->Form->input("attaches.{$image_column}.0", ['type' => 'hidden']); ?>
							</a>
							<?= $this->Form->input("_old_{$image_column}", array('type' => 'hidden', 'default' => h($data[$image_column]), 'class' => 'old_img_input')); ?>
						</div>
					<?php endif; ?>

					<div class="preview_img dpl_none">
						<span class="preview_img_btn" onclick="preview_img_action(this)">画像の削除</span>
					</div>
					<div class="attention">※jpeg , jpg , gif , png ファイルのみ</div>
					<?= $this->Form->error("_image") ?>
				</li>
			</ul>

			<?= $this->Common->infoItemTitle($page_config->id, PageConfigItem::TYPE_MAIN, 'image', 'memo', ''); ?>
		</div>
		<?= $this->element('edit_form/item-end'); ?>

	<?php endif ?>
</div>

<div class="btn_area center">
	<?php if (!empty($data['id']) && $data['id'] > 0) { ?>
		<a href="#" class="btn btn-danger btn_post submitButtonPost">変更する</a>
		<?php if ($this->Common->isUserRole('admin') && !in_array($page_config->slug, [CASESTUDY], true)) : ?>
			<a href="javascript:kakunin('データを完全に削除します。よろしいですか？','<?= $this->Url->build(array('action' => 'delete', $data['id'], 'content')) ?>')" class="btn btn_post btn_delete"><i class="far fa-trash-alt"></i> 削除する</a>
		<?php endif; ?>
	<?php } else { ?>
		<a href="#" class="btn btn-danger btn_post submitButtonPost">登録する</a>
	<?php } ?>
</div>

<?= $this->Form->end(); ?>

<div id="deleteArea" style="display: hide;"></div>

<?php $this->start('beforeBodyClose'); ?>

<script>
	var max_file_size = <?= (1024 * 1024 * 5); ?>;
	var total_max_size = <?= (1024 * 1024 * 30); ?>;
</script>

<link rel="stylesheet" href="/user/common/css/cms.css">
<script src="/user/common/js/jquery.ui.datepicker-ja.js"></script>
<script src="/user/common/js/cms.js"></script>
<script src="/user/common/js/info/base.js"></script>
<script src="/user/common/js/info/edit.js"></script>

<?php $this->end(); ?>