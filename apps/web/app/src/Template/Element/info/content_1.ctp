<?php if ($info->page_config->slug == CASESTUDY) : ?>
    <h2 style="margin-top: calc(var(--vw)*2.63543);" class="c-ttls"><span><?= h($c['title']); ?></span></h2>
<?php else : ?>
    
    <?php if ($info->page_config->slug == COLUMN) : ?>
        <?= isset($h2) && $h2 != 0 ? '</div>' : '' ?>
        <?= isset($h2) ? '<div class="checkH2">' : '' ?>
    <?php endif ?>

    <h2 style="margin-top: calc(var(--vw)*2.63543);"><?= h($c['title']); ?></h2>
<?php endif ?>