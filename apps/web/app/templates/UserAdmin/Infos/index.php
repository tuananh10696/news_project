<?php $this->start('beforeHeadClose'); ?>
<style>
	.breadcrumb-item+.breadcrumb-item::before {
		/*区切り線の変更*/
		font-size: 1.5rem;
		content: '>';
	}
</style>
<?php $this->end() ?>

<?php $this->assign('content_title', h($page_config->page_title)); ?>

<!-- menu_list -->
<?php $this->start('menu_list'); ?>
<?php if ($page_config->parent_config_id) : ?>
	<li class="breadcrumb-item"><a href="/user_admin/infos/?page_slug=<?= $parent_config->slug; ?>"><?= $parent_config->page_title; ?></a></li>
<?php endif; ?>
<li class="breadcrumb-item active"><span><?= h($page_title); ?> </span></li>
<?php $this->end(); ?>
<!-- END menu_list -->

<!--search_box start-->
<?php $filter = __('Slug/{0}/filter', $page_config->slug); ?>
<?php if ($this->elementExists($filter)) echo $this->element($filter); ?>

<?php
$this->assign('data_count', $data_query->count()); // データ件数
$this->assign('create_url', $this->Url->build(array('action' => 'edit', 0, '?' => $query))); // 新規登録URL
?>

<div class="content_inr">

	<?php if ($is_data) : ?>

		<?= $this->element('pagination'); ?>

		<div class="table_list_area">
			<?php if (!empty($page_buttons)) : ?>
				<div style="display:flex; justify-content: space-between;">
					<div>
						<?php foreach ($page_buttons['left'] as $ex) : ?>
							<a href="<?= $this->Url->build($ex->link); ?>" class="btn btn-warning rounded-pill mr-1"><?= $ex->name; ?></a>
						<?php endforeach; ?>
					</div>
					<div class="btn_area" style="margin-top:10px;justify-content:right;margin-bottom:10px !important;">
						<?php foreach ($page_buttons['right'] as $ex) : ?>
							<a href="<?= $this->Url->build($ex->link); ?>" class="btn btn-warning rounded-pill mr-1"><?= $ex->name; ?></a>
						<?php endforeach; ?>
					</div>
				</div>
			<?php endif; ?>

			<?php $list = __('Slug/{0}/list', $page_config->slug); ?>
			<?php if ($this->elementExists($list)) echo $this->element($list); ?>

		</div>
		<?= $this->element('pagination'); ?>
	<?php endif; ?>
</div>

<?php $this->start('beforeBodyClose'); ?>

<link rel="stylesheet" href="/user/common/css/cms.css">
<script>
	$(window).on('load', function() {
		$(window).scrollTop("<?= empty($query['pos']) ? 0 : $query['pos'] ?>");
	})

	function change_category(elm) {
		$("#" + elm).submit();
	}

	$(function() {

		$('.scroll_pos').on('click', function() {
			var sc = window.pageYOffset;
			var link = $(this).attr("href");

			window.location.href = link + "&pos=" + sc;
			return false;
		});

		$('[data-toggle="tooltip"]').tooltip();

	})
</script>

<?php $this->end(); ?>