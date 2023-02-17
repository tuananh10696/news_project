<?php
$class = [
    STAFF => 'detail-article__ttl',
    TOPICS => 'product__info__ttl',
    CASESTUDY => 'article-title'
];
?>
<?php if ($c['title'] != '') : ?>
    <h3 style="margin-top: calc(var(--vw)*2.63543);" class="<?= isset($class[$info->page_config->slug]) ? $class[$info->page_config->slug] : '' ?>"><?= h($c['title']); ?></h3>
<?php endif; ?>