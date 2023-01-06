<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/wysiwyg.css">
<link rel="stylesheet" href="/assets/css/topics.css">

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
                "@id": "http://example.co.jp/topics/",
                "name": "topics"
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
            <h1 class="mv__ttl"><span class="mv__ttl--en">NEWS</span><span class="mv__ttl--jp">新着情報</span></h1>
        </div>
    </div>
    <div class="breadcrumb">
        <ul class="breadcrumb-wrap row">
            <li class="breadcrumb-items"><a href="/">トップページ</a></li>
            <li class="breadcrumb-items"><a href="/topics/">新着情報</a></li>
            <li class="breadcrumb-items"><?= h($info->title) ?></li>
        </ul>
    </div>
    <div class="topics inner">
        <div class="c-detail">
            <div class="c-detail__head"><span class="time"><?= $info->start_datetime->format('Y.m.d') ?></span>
                <h1><?= h($info->title) ?></h1>
            </div>
            <div class="c-detail__content wysiwyg clearfix">

                <?php foreach ($contents as $content) : ?>
                    <?php $is_show = is_show($content) ?>
                    <?php if (!$is_show) : ?>
                        <?= $this->element('info/content_' . $content['block_type'], ['c' => $content]); ?>
                    <?php endif ?>
                <?php endforeach; ?>

            </div>
            <div class="btn-center"><a class="c-btn c-btn--default" href="<?= renderBackUrl('topics') ?>"><span>一覧へ戻る</span></a></div>
        </div>
    </div>
</main>

<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>