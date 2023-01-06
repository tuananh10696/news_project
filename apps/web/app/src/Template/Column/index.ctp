<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/column.css">
<script type="application/ld+json">
    {
        "@context": "https://schema.org/",
        "@type": "BreadcrumbList",
        "itemListElement": [{
            "@type": "ListItem",
            "position": 1,
            "item": {
                "@id": "http://example.co.jp/",
                "name": "HOME"
            }
        }, {
            "@type": "ListItem",
            "position": 2,
            "item": {
                "@id": "http://example.co.jp/column/",
                "name": "column"
            }
        }]
    }
</script>
<style>
    .sub {
        -webkit-font-feature-settings: "palt"1;
        font-feature-settings: "palt"1;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        display: -webkit-box;
        letter-spacing: 1px;
        margin: 7px 0;
        overflow: hidden;
    }
</style>
<?php $this->end('css') ?>

<main>
    <div class="mv">
        <div class="row">
            <h1 class="mv__ttl"><span class="mv__ttl--en">COLUMN</span><span class="mv__ttl--jp">コラム</span>
            </h1>
        </div>
    </div>
    <div class="breadcrumb">
        <ul class="breadcrumb-wrap row">
            <li class="breadcrumb-items"><a href="/">トップページ</a></li>
            <li class="breadcrumb-items">コラム</li>
        </ul>
    </div>
    <div class="column inner">
        <div class="column-des">
            <p>弊社アトムエンジニアリングは、30年以上、物流業、製造業など様々な業種・業界向けに、<br class="show_pc">在庫管理システムを中心とした物流ソリューションを提供させていただいています。<br>弊社のスタッフによる物流、製造に関するコラムをお送りします。</p>
        </div>
        <div class="column-list">
            <?php if ($infos->count() > 0) : ?>
                <?php foreach ($infos as $column_data) : ?>
                    <a class="c-case link__zoom" href="<?= __('/{0}/{1}', COLUMN, $column_data->id) ?>">
                        <figure class="c-case-thumb">
                            <img class="fit" src="<?= $column_data->attaches['image'][0] ?>" alt="" width="480" height="287" loading="lazy" decoding="async">
                        </figure>
                        <div class="c-case__content">
                            <span class="date"><?= $column_data->start_datetime->format('Y.m.d') ?></span>
                            <h3 class="c-case-title"><?= h($column_data->title) ?></h3>
                            <p class="sub"><?= nl2br(h($column_data->notes)) ?></p>
                        </div>
                        <span class="viewmore">VIEW MORE</span>
                    </a>
                <?php endforeach; ?>
            <?php else : ?>
                該当の記事はありません
            <?php endif; ?>
        </div>
        <?= $this->element('pagination') ?>
    </div>
</main>

<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>