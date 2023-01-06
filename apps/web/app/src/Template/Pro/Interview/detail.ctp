<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/wysiwyg.css">
<link rel="stylesheet" href="/assets/css/interview.css?v=5f0198762c2ff47b5ee5de5a4958e56d">
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
                "@id": "http://example.co.jp/pro",
                "name": "導入事例"
            }
        }, {
            "@type": "ListItem",
            "position": 3,
            "item": {
                "@id": "http://example.co.jp/pro/interview/",
                "name": "導入事例"
            }
        }]
    }
</script>
<style>
    .text-center {
        text-align: center;
    }

    .text-right {
        text-align: right;
    }

    dd>a[target="_blank"] {
        color: #00a040;
        box-shadow: 0 1px #00a040;
    }

    .btn-center {
        margin-top: 50px;
    }
</style>
<?php $this->end() ?>
<main>
    <div class="mv">
        <div class="row">
            <h1 class="mv__ttl"><span class="mv__ttl--en">CASE STUDY</span><span class="mv__ttl--jp">導入事例</span>
            </h1>
        </div>
    </div>
    <div class="breadcrumb">
        <ul class="breadcrumb-wrap row">
            <li class="breadcrumb-items"><a href="/">トップページ</a></li>
            <li class="breadcrumb-items"><a href="/pro/interview/">導入事例</a></li>
            <li class="breadcrumb-items"><?= h($info->info_append_items[1]->value_text) ?></li>
        </ul>
    </div>
    <div class="study study-detail inner">
        <div class="engineer">

            <picture>
                <source media="(min-width: 769px)" srcset="<?= $info->info_append_items[4]->attaches['image'][0] ?>" width="1000" height="380">
                <source media="(max-width: 768px)" srcset="<?= $info->info_append_items[5]->attaches['image'][0] ?>" width="768" height="600">
                <img class="fit bg_image" src="<?= $info->info_append_items[5]->attaches['image'][0] ?>" srcset="<?= $info->info_append_items[5]->attaches['image'][0] ?>" alt="">
            </picture>
            <h3 class="engineer-ttl"><?= nl2br(h($info->info_append_items[0]->value_textarea)) ?></h3>
            <p class="engineer-sub">
                <?= h($info->info_append_items[1]->value_text) ?><br><?= $info->info_append_items[2]->value_text != '' ? h($info->info_append_items[2]->value_text)."様" : '' ?></p>
            <?php if ($info->info_append_items[3]->value_text != '') : ?>
                <?php $idYt = getIDofYTfromURL($info->info_append_items[3]->value_text); ?>
                <p class="modal-trigger" data-movie="<?= $idYt ?? $info->info_append_items[3]->value_text ?>"><span>動画はこちら</span></p>
            <?php endif; ?>
        </div>
        <div class="info">
            <figure class="info-image">
                <img class="img_01" src="<?= $info->category->attaches['image'][0] ?>" alt="" width="240" height="130" loading="lazy" decoding="async">
            </figure>
            <h3 class="info-ttl">
                <?= strip_tags($info->category->name)?><br class="show_sp">「<?= $info->category->identifier ?>」導入事例</h3>
            <p><?= nl2br(h($info->notes)) ?></p>
        </div>

        <?php foreach ($contents as $content) : ?>
            <?php $is_show = is_show($content) ?>
            <?php if (!$is_show) : ?>
                <?= $this->element('info/content_' . $content['block_type'], ['c' => $content]); ?>
            <?php endif ?>
        <?php endforeach; ?>

        <?php $url = renderBackUrl('interview') == '/interview' ? '/pro/interview/' : renderBackUrl('interview') ?>
        <div class="btn-center"><a class="c-btn c-btn--default" href="<?= $url ?>"><span>一覧へ戻る</span></a></div>
    </div>
</main>

<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>