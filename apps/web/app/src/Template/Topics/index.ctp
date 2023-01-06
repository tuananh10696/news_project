<?php $this->start('css') ?>
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
<?php $this->end('css') ?>

<main>
    <div class="mv">
        <div class="row">
            <h1 class="mv__ttl">
                <span class="mv__ttl--en">NEWS</span>
                <span class="mv__ttl--jp">新着情報</span>
            </h1>
        </div>
    </div>
    <div class="breadcrumb">
        <ul class="breadcrumb-wrap row">
            <li class="breadcrumb-items"><a href="/">トップページ</a></li>
            <li class="breadcrumb-items">新着情報</li>
        </ul>
    </div>
    <div class="topics inner">
        <div class="topics-list">
            <?php if ($infos->count() > 0) : ?>
                <?php foreach ($infos as $topic_data) : ?>
                    <a class="c-topics" href="<?= __('/{0}/{1}', TOPICS, $topic_data->id) ?>">
                        <span class="c-topics__time"><?= $topic_data->start_datetime->format('Y.m.d') ?></span>
                        <h3 class="c-topics__ttl"><?= h($topic_data->title) ?></h3>
                    </a>
                <?php endforeach; ?>
            <?php else : ?>
                該当の記事はありません
            <?php endif ?>
        </div>
        <?= $this->element('pagination') ?>
    </div>
</main>

<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>