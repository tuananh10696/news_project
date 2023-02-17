<?php $this->start('beforeHeadClose'); ?>
<link rel="stylesheet" type="text/css" href="/user/common/js/datetimepicker-master/jquery.datetimepicker.css" />
<style>
	.ck-editor__editable_inline {
		min-height: 300px;
	}

	.ui-state-highlight {
		border: 2px red solid;
	}

	.table__column {
		width: calc(100% - 135px) !important;
	}
</style>
<?php $this->end(); ?>

<?php $this->assign('content_title', h($page_config->page_title)); ?>

<?php $this->start('menu_list'); ?>
<li class="breadcrumb-item"><a href="<?= $this->Url->build(['action' => 'index', '?' => ['sch_page_id' => $page_config->id]]); ?>"><?= h($page_title) ?></a></li>
<li class="breadcrumb-item active"><span><?= $entity->id > 0 ? '編集' : '新規登録'; ?></span></li>
<?php $this->end(); ?>

<?php $this->start('content_header'); ?>
<h2 class="card-title"><?= ($entity->id > 0) ? '編集' : '新規登録'; ?></h2>
<?php $this->end(); ?>

<!-- --- Form --- -->
<?= $this->editForm->render(); ?>

<?php $this->start('beforeBodyClose'); ?>
<script src="/user/common/js/jquery.ui.datepicker-ja.js"></script>
<script src="/user/common/js/cms.js"></script>
<script src="/user/common/js/ckeditor/ckeditor.js"></script>
<script src="/user/common/js/ckeditor/translations/ja.js"></script>

<script src="/user/common/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>
<?= $this->Html->script('/user/common/js/system/pop_box'); ?>
<script>
	var rownum = 0;
	var tag_num = <?= $info_tag_count ?? 0; ?>;
	var max_row = 100;
	var pop_box = new PopBox();
	var out_waku_list = <?= json_encode($out_waku_list); ?>;
	var block_type_waku_list = <?= json_encode($block_type_waku_list); ?>;
	var block_type_relation = 14;
	var block_type_relation_count = 0;
	var max_file_size = <?= (1024 * 1024 * 5); ?>;
	var total_max_size = <?= (1024 * 1024 * 30); ?>;
	var form_file_size = 0;
	var page_config_id = <?= $page_config->id; ?>;

	var page_config_slug = '<?= $page_config->slug; ?>';
	jQuery.datetimepicker.setLocale('ja');
	jQuery('._datepicker').datetimepicker({
		format: 'Y/m/d',
		timepicker: false,
		lang: 'ja',
		scrollMonth: false,
		scrollInput: false
	});
	jQuery('.datetimepicker').datetimepicker({
		format: 'Y/m/d H:i',
		lang: 'ja',
		scrollMonth: false,
		scrollInput: false
	});
</script>
<script>
	$(document).on("change", "._color", function() {
		$(this).siblings('input').val($(this).val())
	})
</script>
<?= $this->Html->script('/user/common/js/info/base'); ?>
<?= $this->Html->script('/user/common/js/info/edit'); ?>
<script src="/user/common/js/info/multiple-uploader.js"></script>
<?php $this->end(); ?>