<?php $this->assign('content_title', '項目設定'); ?>
<?php $this->start('menu_list'); ?>
<li class="breadcrumb-item"><a href="<?= $this->Url->build(['action' => 'index', '?' => ['page_id' => $page_config->id]]); ?>">項目設定</a></li>
<li class="breadcrumb-item active"><span><?= ($entity->id > 0) ? '編集' : '新規登録'; ?></span></li>
<?php $this->end(); ?>

<?php $is_main = $entity->isNew() || $entity->parts_type == 'main'; ?>
<?php $is_block = !$entity->isNew() && $entity->parts_type == 'block'; ?>
<?php $is_section = !$entity->isNew() && $entity->parts_type == 'section'; ?>

<?php $this->start('content_header'); ?>
<h2 class="card-title"><?= ($entity->id > 0) ? '編集' : '新規登録'; ?></h2>
<?php $this->end(); ?>

<?= $this->Form->create($entity, array('type' => 'file', 'context' => ['validator' => 'default'], 'name' => 'fm', 'templates' => $form_templates)); ?>
<?= $this->Form->input('id', array('type' => 'hidden', 'value' => $entity->id)); ?>
<?= $this->Form->input('page_config_id', array('type' => 'hidden', 'value' => $page_config->id)); ?>
<?= $this->Form->hidden('position'); ?>

<div class="table_edit_area">

	<?= $this->element('edit_form/item-start', ['title' => '項目種別', 'required' => true]); ?>
	<?= $this->Form->input('parts_type', ['type' => 'select', 'options' => $parts_type_list, 'class' => 'form-control', 'onchange' => 'changeDataType(this)']); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => '項目キー', 'required' => true, 'elementClass' => 'not_section']); ?>
	<?= $this->Form->select($is_main ? 'item_key' : 'null', $list_item_key, ['class' => __('form-control _main _main_key {0}', $is_main ? '' : 'd-none')]); ?>
	<?= $this->Form->select($is_block ? 'item_key' : 'null', $list_item_key_block, ['class' => __('form-control _block _block_key {0}', $is_block ? '' : 'd-none')]); ?>
	<?= $this->Form->select($is_section ? 'item_key' : 'null', $list_item_key_section, ['class' => __('form-control _section _section_key d-none')]); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => 'データ型', 'required' => true, 'elementClass' => 'not_section']); ?>
	<?= $this->Form->select($is_main ? 'item_type' : 'null', $value_type_list, ['class' => __('form-control _main {0}', $is_main ? '' : 'd-none')]); ?>
	<?= $this->Form->select($is_block ? 'item_type' : 'null', $value_type_list_block, ['class' => __('form-control _block {0}', $is_block ? '' : 'd-none')]); ?>
	<?= $this->Form->select($is_section ? 'item_type' : 'null', $value_type_list_section, ['class' => __('form-control _section d-none')]); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => '項目名', 'required' => false, 'elementClass' => 'not_section']); ?>
	１行目<?= $this->Form->input('title', array('type' => 'text', 'maxlength' => 40, 'class' => 'form-control')); ?>
	２行目<?= $this->Form->input('sub_title', array('type' => 'text', 'maxlength' => 40, 'class' => 'form-control')); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => '入力必須', 'required' => false, 'elementClass' => 'not_section']); ?>
	<?= $this->Form->input('is_required', ['type' => 'checkbox', 'value' => 1, 'label' => '入力を必須にする', 'hiddenField' => true]); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => '文字数制限', 'required' => false, 'elementClass' => 'not_section']); ?>
	<?= $this->Form->input('max_length', ['type' => 'text', 'maxlength' => 5, 'style' => 'width:100px;', 'class' => 'form-control']); ?>
	<?= $this->element('edit_form/item-end'); ?>

	<?= $this->element('edit_form/item-start', ['title' => '状態']); ?>
	<?= $this->element('edit_form/item-status', ['enable_value' => 'Y', 'disable_value' => 'N']); ?>
	<?= $this->element('edit_form/item-end'); ?>

</div>
<?= $this->Form->end(); ?>

<div class="btn_area center">
	<?php if (!empty($data['id']) && $data['id'] > 0) { ?>
		<a href="javascript:void(0)" onclick="document.fm.submit();" class="btn btn-danger btn_post submitButton">変更する</a>
		<?php if ($this->Common->isUserRole('admin')) : ?>
			<a href="javascript:kakunin('データを完全に削除します。よろしいですか？','<?= $this->Url->build(array('action' => 'delete', $data['id'], 'content', '?' => $query)) ?>')" class="btn btn_post btn_delete"><i class="far fa-trash-alt"></i> 削除する</a>
		<?php endif; ?>
	<?php } else { ?>
		<a href="javascript:void(0)" onclick="document.fm.submit();" class="btn btn-danger btn_post submitButton">登録する</a>
	<?php } ?>
</div>

<div id="deleteArea" style="display: hide;"></div>


<!--コンテンツ 終了-->
<?php $this->start('beforeBodyClose'); ?>
<link rel="stylesheet" href="/user/common/css/cms.css">

<script src="/user/common/js/jquery.ui.datepicker-ja.js"></script>
<script src="/user/common/js/cms.js"></script>

<script>
	function changeDataType(e) {
		var eval = $(e).val();

		$(`._${eval}`)
			.attr('name', 'item_type')
			.siblings('select')
			.attr('name', 'null');

		$(`._${eval}_key`)
			.attr('name', 'item_key')
			.siblings('select')
			.attr('name', 'null');

		if (eval != 'section') {
			$('.not_section').removeClass('d-none');
			$(`._${eval}`)
				.removeClass('d-none')
				.siblings('select')
				.addClass('d-none');
		} else
			$('.not_section').addClass('d-none');

	}

	function changeHome() {
		var is_home = $("#idIsHome").prop('checked');
		if (is_home) {
			$("#idSlug").val('');
			$("#idSlug").prop('readonly', true);
			$("#idSlug").css('backgroundColor', "#e9e9e9");
		} else {
			$("#idSlug").prop('readonly', false);
			$("#idSlug").css('backgroundColor', "#ffffff");
		}
	}

	function changeSlug() {
		var slug = $("#idSlug").val();
		if (slug != "") {
			$("#idIsHome").prop('checked', false);
		}
	}

	$(function() {

		changeHome();

		changeDataType('#parts-type');

		$("#idIsHome").on('change', function() {
			changeHome();
		});

		$("#idSlug").on('change', function() {
			changeSlug();
		});
	})
</script>
<?php $this->end(); ?>