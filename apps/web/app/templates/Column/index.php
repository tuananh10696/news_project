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
	<div class="main__inner">
		<div class="mv">
			<div class="row mv__inner">
				<h2 class="mv__title">コラム</h2>
			</div>
		</div>
		<div class="block-aside">
			<div class="row">
				<div class="block-aside__wrap">
					<div class="aside">
						<h3 class="aside__ttl">CATEGORY</h3>
						<ul class="aside__categories">
							<?php foreach ($category as $cat) : ?>
								<li><a href="<?= __('/column{0}', $cat->id != 0 ? __('?category_id={0}', $cat->id) : '') ?>"><?= h($cat->name) ?>（<?= count($cat->infos) ?>）</a></li>
							<?php endforeach ?>
						</ul>
					</div>
					<div class="block-content">
						<ul class="list-column">

							<?php foreach ($infos as $data) : ?>

								<li class="list-column__item">
									<a class="list-column__link" href="<?= __('/column/{0}', $data->id) ?>">
										<h4 class="list-column__label <?= @$cat_color[$data->category->cate_color] ?>">
											<span><?= h($data->category->name) ?></span>
										</h4>
										<figure class="list-column__image">
											<img class="fit" src="<?= $data->attaches['image'][0] != '' ? $data->attaches['image'][0] : '/assets/images/common/no_img.jpg' ?>" alt="" width="609" height="465" loading="lazy" decoding="async">
										</figure>
										<p class="list-column__text"><?= h($data->title) ?></p>
										<p class="list-column__date"><?= @$data->date->format('Y.m.d') ?></p>
									</a>
								</li>

							<?php endforeach ?>

						</ul>
						<?= $this->element('pagination') ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="block-breadcrumb">
		<div class="row">
			<ul class="breadcrumb">
				<li><a href="/">トップ</a></li>
				<li><span>コラム</span></li>
			</ul>
		</div>
	</div>
</main>