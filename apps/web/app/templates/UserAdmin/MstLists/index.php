<?php $this->assign('content_title', 'リスト一覧'); ?>

<?php $this->start('menu_list'); ?>
<li class="breadcrumb-item active"><span>リスト一覧 </span></li>
<?php $this->end(); ?>

<!--search_box start-->
<?php $this->start('search_box'); ?>
<div class="row">
	<div class="col-12">
		<div class="card on">
			<div class="card-header bg-gray-dark">
				<h2 class="card-title">検索条件</h2>
				<div class="card-tools">
					<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse"><i class="fas fa-minus"></i></button>
				</div>
			</div>
			<div class="card-body">

				<!-- 検索開始ボタン用フォーム -->
				<!-- 多階層カテゴリ以外-->
				<?= $this->Form->create(null, ['type' => 'get', 'valueSources' => ['query'], 'id' => 'fm_search', 'templates' => $form_templates]); ?>
				<div class="table__search">
					<div class="row">
						<div class="col-2" style="min-width: 200px">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">システム区分</span>
								</div>

								<?php if ($this->Common->isUserRole('develop')) : ?>
									<?= $this->Form->input('sys_cd', [
										'type' => 'select',
										'options' => $sys_list,
										'onChange' => 'change_category();',
										'class' => 'form-control'
									]); ?>
								<?php else : ?>

									<?= $this->Form->hidden('sys_cd', ['value' => \App\Model\Entity\MstList::LIST_FOR_USER]); ?>
									<?= $sys_list[\App\Model\Entity\MstList::LIST_FOR_USER]; ?>
								<?php endif; ?>
							</div>
						</div>

						<div class="col-4">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">リスト</span>
								</div>

								<?= $this->Form->input('slug', [
									'type' => 'select',
									'class' => 'form-control',
									'options' => $slug_list,
									'onChange' => 'change_category();',
									'empty' => '選択してください'
								]); ?>
							</div>
						</div>
					</div>
					<?php if ($this->Common->isUserRole('develop')) : ?>
						<div class="btn_area center">
							<a href="<?= $this->Url->build(['action' => 'edit', 0, '?' => $query]); ?>" class="btn btn-primary mr-2">新規登録</a>
						</div>
					<?php endif; ?>
				</div>
				<?= $this->Form->end(); ?>
			</div>
		</div>
		<!--/.card-->
	</div>
	<!--/.col-12-->
</div>
<!--/.row-->
<?php $this->end(); ?>

<?php
$this->assign('data_count', $data_query->count()); // データ件数
$this->assign('create_url', empty($query['slug']) ? '' : $this->Url->build(array('action' => 'edit', '?' => $query)));
$this->assign('create_label', 'リストへ追加'); //新規登録ボタンの表示名（指定なければ「新規登録」）
?>

<div class="table_list_area">
	<table class="table table-sm table-hover table-bordered dataTable dtr-inline" style="table-layout: fixed;">
		<colgroup>
			<col style="width: 70px;">
			<col style="width: 100px;">
			<col style="width: 120px;">
			<col>
			<col style="width: 150px;">
			<col style="width: 150px;">
			<col style="width: 70px;">

			<?php if ($this->Common->isUserRole('admin') && !empty($query['slug'])) : ?>
				<col style="width: 150px">
			<?php endif; ?>
		</colgroup>

		<thead class="bg-gray">
			<tr>
				<th>#</th>
				<th style="text-align:left;">リスト名</th>
				<th style="text-align:left;">値</th>
				<th style="text-align:left;">項目</th>
				<th style="text-align:center;">識別子</th>
				<th style="text-align:left;">予備キー</th>
				<th style="text-align:left;">詳細</th>
				<?php if ($this->Common->isUserRole('admin') && !empty($query['slug'])) : ?>
					<th>順序の変更</th>
				<?php endif; ?>
			</tr>
		</thead>

		<tbody>
			<?php
			foreach ($data_query->toArray() as $key => $data) :
				$no = sprintf("%02d", $data->id);
				$id = $data->id;
				$status = ($data->status === 'publish' ? true : false);
			?>

				<tr class="<?= $status ? "visible" : "unvisible" ?>" id="content-<?= $data->id ?>">
					<td title=""> <?= $data->id ?> </td>
					<td> <?= h($data->name) ?> </td>
					<td> <?= h($data->ltrl_cd) ?> </td>
					<td> <?= $this->Html->link($data->ltrl_val, ['action' => 'edit', $data->id, '?' => $query], ['class' => 'btn btn-light w-100 text-left']) ?> </td>
					<td> <?= h($data->slug) ?> </td>
					<td> <?= h($data->ltrl_sub_val) ?> </td>
					<td> <?= $this->Html->link("編集", ['action' => 'edit', $data->id], ['class' => 'btn btn-success']) ?> </td>
					<?php if ($this->Common->isUserRole('admin') && !empty($query['slug'])) : ?>
						<td>
							<?= $this->element('position', ['key' => $key, 'data' => $data, 'data_query' => $data_query]); ?>
						</td>
					<?php endif; ?>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
</div>

<?php $this->start('beforeBodyClose'); ?>
<link rel="stylesheet" href="/admin/common/css/cms.css">
<script>
	function change_category() {
		$("#fm_search").submit();
	}
</script>
<?php $this->end(); ?>