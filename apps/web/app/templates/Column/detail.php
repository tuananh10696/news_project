<?php

use App\Model\Entity\Info;
?>

<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/column.css?v=1aa081b56464c1260517a5ebd1c4a7f1">

<script type="application/ld+json">
	{
		"@context": "https://schema.org/",
		"@type": "BreadcrumbList",
		"itemListElement": [{
			"@type": "ListItem",
			"position": 1,
			"item": {
				"@id": "https://s-shioyaijuteijuhtml-develop.sampleweb.org/",
				"name": "トップ"
			}
		}, {
			"@type": "ListItem",
			"position": 2,
			"item": {
				"@id": "https://s-shioyaijuteijuhtml-develop.sampleweb.org/column/",
				"name": "コラム"
			}
		}]
	}
</script>
<?php $this->end() ?>

<main class="main" id="main">
	<div class="main__inner no-mv">
		<div class="row__sm">
			<div class="wysiwyg">
				<div class="description description-image">
					<div class="description__pic">
						<img src="<?= $info->attaches['image'][0] ?>" alt="" width="420" height="321" loading="lazy" decoding="async">
					</div>
					<div class="description__text">
						<div class="tags">
							<p class="label <?= @$cat_color[$info->category->cate_color] ?>"><?= h($info->category->name) ?></p>
							<p class="date"><?= h(@$info->date->format('Y.m.d')) ?></p>
						</div>
						<h1><?= h($info->title) ?></h1>
						<p><?= nl2br(h($info->notes)) ?></p>
					</div>
				</div>
				<?php $check_h2 = 0; ?>
				<?php foreach ($contents as $content) : ?>
					<?php $is_show = is_show($content) ?>
					<?php $block = isset(Info::$block_number2key_list[$content->block_type]) ? strtolower(Info::$block_number2key_list[$content->block_type]) : 'default' ?>
					<?php if (!$is_show) : ?>
						<?= $this->element('Block/' . $block, ['c' => $content, 'h2' => $check_h2]); ?>
						<?php if ($block == 'h2') $check_h2++; ?>
					<?php endif ?>
				<?php endforeach; ?>
				<?= $check_h2 > 0 ? '</div>' : '' ?>
				<div class="c-btn space--large"><a class="btn btn-primary btn-primary__back" href="/column"><i class="icon-arrow glyphs-arrow-left"></i>一覧に戻る</a></div>
			</div>
		</div>
	</div>

	<?php if ($readmore->count() > 0) : ?>
		<div class="block-related">
			<div class="row">
				<h3 class="related__ttl">関連記事</h3>
				<ul class="list-column">
					<?php foreach ($readmore as $data) : ?>

						<li class="list-column__item">
							<a class="list-column__link" href="<?= __('/column/{0}', $data->id) ?>">
								<h4 class="list-column__label <?= @$cat_color[$data->category->cate_color] ?>">
									<span><?= h($data->category->name) ?></span>
								</h4>
								<figure class="list-column__image">
									<img class="fit" src="<?= $data->attaches['image'][0] != '' ? $data->attaches['image'][0] : '/assets/images/common/no_img.jpg' ?>" alt="" width="340" height="260" loading="lazy" decoding="async">
								</figure>
								<p class="list-column__text"><?= h($data->title) ?></p>
								<p class="list-column__date"><?= @$data->date->format('Y.m.d') ?></p>
							</a>
						</li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	<?php endif; ?>
	<div class="block-breadcrumb">
		<div class="row">
			<ul class="breadcrumb">
				<li><a href="/">トップ</a></li>
				<li><a href="/column/">コラム</a></li>
				<li><span><?= h($info->title) ?></span></li>
			</ul>
		</div>
	</div>
</main>

<?php $this->start('js') ?>
<script src="/assets/js/modal-video.js?v=cc372d69cbc36b0d655cb586f5fbdd88" defer></script>
<script src="/user/common/js/jquery.js" defer></script>
<script src="/user/common/js/mokuji.js" defer></script>

<?php $this->end() ?>