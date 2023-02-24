<?php if ($c->content != '') : ?>
    <?php if ($c->option_value3 == 'youtube') : ?>
        <?php $id = intval($c->option_value2) == 1 ? getIDofYTfromURL($c->content) : $c->content ?>
        <div class="video-post">
            <a href="https://www.youtube.com/watch?v=<?= $id ?>" class="glightbox link-video">
                <span class="bi-play-fill"></span>
                <img style="width: 100%!important;height: auto;" src="<?= __('https://img.youtube.com/vi/{0}/maxresdefault.jpg', $id) ?>" alt="" width="900" height="506" loading="lazy" decoding="async"><i class="icon icon-play"></i>
            </a>
        </div>
    <?php endif ?>
<?php endif ?>