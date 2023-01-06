<?php

use Cake\Utility\Hash; ?>

<?php $this->start('css') ?>
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
<?php $this->end() ?>

<?php $category_id = isset($category_id) ? $category_id : 0 ?>
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
            <li class="breadcrumb-items">導入事例</li>
        </ul>
    </div>
    <div class="study inner">
        <p class="description">在庫管理システムやレンタル品管理システム、各種物流システムなど、<br class="show_pc">弊社アトムエンジニアリングの製品を導入したお客様の声をご紹介いたします。</p>
        <div class="interview">
            <div class="sort">
                <?php $cate_name = Hash::combine($category, '{n}.id', '{n}.name');  ?>
                <p class="sort__tl show_sp" id="js-toggleTrigger"><span class="text"><?= $category_id == 0 ? 'すべて' : strip_tags($cate_name[$category_id]) ?></span>
                </p>
                <div class="sort__action" id="js-toggleContent">
                    <ul class="sort__list">

                        <li><a class="<?= $category_id == 0 ? 'active' : '' ?>" href="/pro/interview/">すべて</a></li>
                        <?php foreach ($category as $cat) : ?>
                            <li><a class="<?= $category_id == $cat->id ? 'active' : '' ?>" href="<?= __('/pro/interview/?category_id={0}', $cat->id) ?>"><?= $cat->name ?></a></li>
                        <?php endforeach ?>

                    </ul>
                </div>
            </div>

            <div class="interview-list">
                <?php if ($infos->count() > 0) : ?>
                    <?php foreach ($infos as $info) : ?>
                        <a class="c-case link__zoom" href="<?= __('/pro/interview/{0}', $info->id) ?>">
                            <figure class="c-case-thumb">
                                <img class="fit" src="<?= __($info->attaches['image'][0]) ?>" alt="" width="480" height="287" loading="lazy" decoding="async">
                                <img class="logo logo_01" src="<?= $info->category->attaches['image'][0] ?>" alt="" width="240" height="130" loading="lazy" decoding="async">
                            </figure>
                            <div class="c-case__content">
                                <span class="tag"><?= __('{0} {1}', strip_tags($info->category->name), strip_tags($info->category->identifier)) ?></span>
                                <h3 class="c-case-title"><?= nl2br(h($info->title)) ?></h3>
                                <p class="sub"><?= h($info->info_append_items[1]->value_text) ?></p>
                            </div>
                            <span class="viewmore">VIEW MORE</span>
                        </a>
                    <?php endforeach ?>
                <?php else : ?>
                    <span class="viewmore">該当の記事はありません</span>
                <?php endif ?>
            </div>
            <ul class="paging">
                <?= $this->element('pagination') ?>
            </ul>
        </div>
    </div>
</main>

<?php $this->start('contact') ?>
<?php include_once WWW_ROOT . 'assets/include/contact.html' ?>
<?php $this->end() ?>

<?php $this->start('script') ?>
<script src="/assets/js/interview.js?v=5496fcf48ef80f9e53b38c071d5603b5" defer></script>
<?php $this->end() ?>