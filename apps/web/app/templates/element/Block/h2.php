<?php dd(1) ?>
<?php if ($info->page_config->slug == 'column') : ?>
    <?= isset($h2) && $h2 != 0 ? '</div>' : '' ?>
    <?= isset($h2) ? '<div class="box-content">' : '' ?>
<?php endif ?>
<h2 class="page-tl"><?= h($c->h2) ?></h2>