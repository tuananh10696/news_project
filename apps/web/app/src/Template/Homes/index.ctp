<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/index.css">
<?php $this->end('css') ?>

<main>
	<div class="content-images">
		<div class="content-images__items"><img src="/assets/images/top/mv_01.jpg?v=499021c717d84c4514ddee01de0d4545" alt="" width="1500" height="952" loading="lazy" decoding="async">
		</div>
		<div class="content-images__items"><img src="/assets/images/top/mv_02.jpg?v=5f15174a3073ada2c0c59080d178761b" alt="" width="1500" height="952" loading="lazy" decoding="async">
		</div>
		<div class="content-images__items"><img src="/assets/images/top/mv_01.jpg?v=499021c717d84c4514ddee01de0d4545" alt="" width="1500" height="952" loading="lazy" decoding="async">
		</div>
	</div>
	<div class="content">
		<div class="content-bg"></div>
		<div class="create js-scroll row">
			<div class="create-wrap"><span class="create-wrap__logo"><img src="/assets/images/top/text_logo.png?v=54aedd4b59beab5b6748bb80fd121a1d" alt="ATOM ENGINEERING Co.L+d" width="386" height="18" loading="lazy" decoding="async"></span><span class="create-wrap__text">CREATE</span><br><span class="create-wrap__text">THE</span><br class="show_sp"><span class="create-wrap__stroke">FUTURE</span></div>
			<div class="create-scroll"><a class="create-scroll__link" href="#business">SCROLL</a></div>
		</div>
		<div class="business js-scroll row" id="business">
			<div class="business-txt">
				<h2 class="ttl"><span class="ttl-en">BUSINESS</span><span class="ttl-ja">事業紹介</span></h2>
				<p>アトムエンジニアリングでは、<br>システムを通してお客様が抱える<br>「課題」や「悩み」を解決します。</p><a class="c-btn c-btn--more c-btn--white" href="/business/"><span>VIEW MORE</span></a>
			</div>
			<div class="business-group">
				<div class="business-group__items business-group__items--01"><span>物流に特化した</span>
					<p>システムの企画・開発</p>
				</div>
				<div class="business-group__items business-group__items--02"><span>物流関連企業への</span>
					<p>コンサルティング</p>
				</div>
				<div class="business-group__items business-group__items--03"><span>パートナー企業との</span>
					<p>連携</p>
				</div>
			</div>
		</div>
		<div class="products js-scroll row">
			<h2 class="ttl ttl--center"><span class="ttl-en">PRODUCTS</span><span class="ttl-ja">製品情報</span></h2>
			<div class="c-product"> <a class="c-product-item link__zoom" href="https://www.zaikokanri.com/" target="_blank">
					<figure><img class="img_01" src="/assets/images/common/img_product_01.png?v=a247ebe4a119472bd9506179d22e9b4a" alt="" width="210" height="113" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">クラウド在庫管理<br class="show_sp">システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/barcorrect/">
					<figure><img class="img_02" src="/assets/images/common/img_product_02.png?v=e177d7025800163b3a8c754568fca156" alt="" width="226" height="63" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">クラウド検品<br class="show_sp">システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/rental/">
					<figure><img class="img_03" src="/assets/images/common/img_product_03.png?v=1892fa2cbbff1303854f697e61fb7989" alt="" width="218" height="102" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">レンタル品管理<br class="show_sp">システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/passsort/">
					<figure><img class="img_04" src="/assets/images/common/img_product_04.png?v=c8c0c30864f48c51d35a49fed706c542" alt="" width="223" height="30" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">仕分検品システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/shiwakedou/">
					<figure><img class="img_05" src="/assets/images/common/img_product_05.png?v=38d8f3eccbbc6948c8a1c33cfcfb987e" alt="" width="199" height="65" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">デジタルアソート<br class="show_sp">システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/digipica/">
					<figure><img class="img_06" src="/assets/images/common/img_product_06.png?v=c770405c1ce944273b0ab848a8c62a23" alt="" width="190" height="55" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">デジタルピッキング<br class="show_sp">システム</h3>
				</a><a class="c-product-item link__zoom" href="/pro/tremas/">
					<figure><img class="img_07" src="/assets/images/common/img_product_07.png?v=7c124284d48a78fba1c55939ddc7ed7b" alt="" width="247" height="44" loading="lazy" decoding="async">
					</figure>
					<h3 class="c-product-ttl">マルチピッキング<br class="show_sp">カート</h3>
				</a>
			</div>
		</div>
	</div>

	<div class="casestudy js-slide">
		<div class="row">
			<h2 class="ttl ttl--black"><span class="ttl-en">CASE STUDY</span><span class="ttl-ja">導入事例</span></h2>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">

				<?php foreach (${CASESTUDY}->toArray() as $info) : ?>
					<div class="swiper-slide">
						<a class="c-case link__zoom" href="<?= __('/pro/interview/{0}', $info->id) ?>">
							<figure class="c-case-thumb">
								<img class="fit" src="<?= $info->attaches['image'][0] ?>" alt="" width="480" height="287" loading="lazy" decoding="async">
								<img class="logo logo_01" src="<?= $info->category->attaches['image'][0] ?>" alt="" width="240" height="130" loading="lazy" decoding="async">
							</figure>
							<div class="c-case__content">
								<span class="tag"><?= h(__('{0}{1}', strip_tags($info->category->name), $info->category->identifier)) ?></span>
								<h3 class="c-case-title"><?= h($info->title) ?></h3>
								<p class="sub"><?= h(@$info->info_append_items[1]['value_text']) ?></p>
							</div>
						</a>
					</div>

				<?php endforeach ?>

			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
		<div class="swiper-pagination"></div>
		<div class="btn-center"><a class="c-btn c-btn--more" href="/pro/interview/"><span>VIEW MORE</span></a></div>
	</div>
	<div class="client">
		<div class="row">
			<h2 class="ttl ttl--center ttl--black"><span class="ttl-en">CLIENT</span><span class="ttl-ja">導入企業一覧</span></h2>
			<div class="client-logo">
				<picture>
					<source media="(min-width: 769px)" srcset="/assets/images/top/clientlogo.png" width="1094" height="346">
					<source media="(max-width: 768px)" srcset="/assets/images/top/clientlogo_sp.png?v=c20f12ddcb5c3c0c13e5e79adc8f85cb" width="698" height="655"><img src="/assets/images/top/clientlogo_sp.png?v=c20f12ddcb5c3c0c13e5e79adc8f85cb" srcset="/assets/images/top/clientlogo_sp.png?v=c20f12ddcb5c3c0c13e5e79adc8f85cb" alt="">
				</picture>
			</div>
			<div class="client-note">※五十音順</div>
		</div>
	</div>
	<div class="news">
		<div class="news-row row">
			<div class="news-lf">
				<h2 class="ttl"><span class="ttl-en">NEWS</span><span class="ttl-ja">お知らせ</span></h2><a class="c-btn c-btn--more c-btn--white" href="/topics/"><span>VIEW MORE</span></a>
			</div>
			<div class="news-list">

				<?php foreach (${TOPICS}->toArray() as $info) : ?>

					<a class="news-items link__alpha" href="<?= __('/topics/{0}', $info->id) ?>">
						<span class="news-items__time"><?= (new DateTime($info->start_datetime ? $info->start_datetime : 'now'))->format('Y.m.d') ?></span>
						<p class="news-items__des"><?= h($info->title) ?></p>
					</a>

				<?php endforeach ?>

			</div>
		</div>
	</div>
	<div class="column js-slide">
		<div class="row">
			<h2 class="ttl ttl--black ttl--center"><span class="ttl-en">COLUMN</span><span class="ttl-ja">コラム</span></h2>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">

				<?php foreach (${COLUMN}->toArray() as $info) : ?>

					<div class="swiper-slide">
						<a class="c-case link__zoom" href="<?= __('/column/{0}', $info->id) ?>">
							<figure class="c-case-thumb">
								<img class="fit" src="<?= $info->attaches['image'][0] ?>" alt="" width="480" height="287" loading="lazy" decoding="async">
							</figure>
							<div class="c-case__content">
								<h3 class="c-case-title"><?= h($info->title) ?></h3>
								<p class="sub"></p>
							</div>
						</a>
					</div>

				<?php endforeach ?>

			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
		<div class="swiper-pagination"></div>
		<div class="btn-center"><a class="c-btn c-btn--more" href="/column/"><span>VIEW MORE</span></a></div>
	</div>
	<div class="about">
		<div class="about-block">
			<div class="about-block__img"><img src="/assets/images/top/company.jpg?v=da4afc721d946ef813432e0d4b95dd6d" alt="" width="691" height="457" loading="lazy" decoding="async">
			</div>
			<div class="about-block__info">
				<h2 class="ttl ttl--black"><span class="ttl-en">COMPANY</span><span class="ttl-ja">企業情報</span></h2>
				<p>アトムエンジニアリングについてご紹介いたします。</p><a class="c-btn c-btn--more" href="/company/"><span>VIEW MORE</span></a>
			</div>
		</div>
		<div class="about-block">
			<div class="about-block__img"><img src="/assets/images/top/recruit.jpg?v=f18b7262057da37103ccb111b6398c04" alt="" width="691" height="457" loading="lazy" decoding="async">
			</div>
			<div class="about-block__info">
				<h2 class="ttl ttl--black"><span class="ttl-en">RECRUIT</span><span class="ttl-ja">採用情報</span></h2>
				<p>一緒に働く仲間を募集しています。</p><a class="c-btn c-btn--more" href="/recruit/"><span>VIEW MORE</span></a>
			</div>
		</div>
	</div>
	<div class="contact">
		<div class="row">
			<p class="contact-ttl">資料請求や弊社サービスなど<br class="show_sp">お問い合わせフォームより<br class="show_sp">お問い合わせください。</p><a class="c-btn c-btn--default c-btn--white" href="/contact/" target="_blank"><span>資料請求・お問い合わせ</span></a>
		</div>
	</div>
</main>