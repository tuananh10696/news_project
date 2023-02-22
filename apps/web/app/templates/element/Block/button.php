<div class="c-btn">
    <a class="btn btn-primary <?= mb_strlen(trim($c->title), 'UTF-8') > 10 ? 'btn-primary--large' : ''  ?>" href="<?= h($c->content) ?>" target="<?= h($c->option_value2); ?>">
        <?= h($c->title) ?><i class="icon-arrow glyphs-arrow-right"></i>
    </a>
</div>