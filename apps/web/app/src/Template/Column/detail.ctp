<?php

use App\Model\Entity\Info;
?>

<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/wysiwyg.css">
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
    .btn-center {
        margin-top: 50px;
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
            <li class="breadcrumb-items"><a href="/column/">コラム</a></li>
            <li class="breadcrumb-items"><?= h($info->title) ?></li>
        </ul>
    </div>

    <div class="column column-detail inner">
        <div class="c-detail">
            <div class="c-detail__head"><span class="time"><?= $info->start_datetime->format('Y.m.d') ?></span>
                <h1><?= h($info->title) ?></h1>
                <h3><?= nl2br(h($info->notes)) ?></h3>
            </div>

            <div class="c-detail__content wysiwyg clearfix">
                <?php $check_h2 = 0; ?>
                <?php foreach ($contents as $content) : ?>
                    <?php $is_show = is_show($content) ?>

                    <?php if (!$is_show) : ?>
                        <?= $this->element('info/content_' . $content['block_type'], ['c' => $content, 'h2' => $check_h2]); ?>
                        <?php if ($content['block_type'] == Info::BLOCK_TYPE_TITLE && $info->page_config->slug == COLUMN) $check_h2++; ?>
                    <?php endif ?>

                <?php endforeach; ?>
                <?= $check_h2 > 0 ? '</div>' : '' ?>
            </div>
        </div>


        <div class="popular">
            <h2>よく読まれているコラム</h2>
            <div class="popular-list">
                <?php foreach ($popular as $popular_data) : ?>
                    <a class="c-case link__zoom" href="/column/<?= $popular_data->id ?>">
                        <figure class="c-case-thumb"><img class="fit" src="<?= $popular_data->attaches['image'][0] ?>" alt="" width="480" height="287" loading="lazy" decoding="async">
                        </figure>
                        <div class="c-case__content"> <span class="date"><?= $popular_data->start_datetime->format('Y.m.d') ?></span>
                            <h3 class="c-case-title"><?= h($popular_data->title) ?></h3>
                            <p class="sub"><?= h($popular_data->notes) ?></p>
                        </div><span class="viewmore">VIEW MORE</span>
                    </a>
                <?php endforeach; ?>
            </div>
        </div>
        <div class="btn-center"><a class="c-btn c-btn--default" href="<?= renderBackUrl('column') ?>"><span>一覧へ戻る</span></a></div>

    </div>
</main>


<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>

<?php $this->start('script') ?>
<?= $this->Html->script(['/user/common/js/jquery-3.6.1.min.js', '/user/common/js/mokuji.js']) ?>
<?php $this->end() ?>