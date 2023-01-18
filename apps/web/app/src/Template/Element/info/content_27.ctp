<div class="yt">
    <?php $v = $c['content'];  ?>
    <?php $id = getIDofYTfromURL($v); ?>
    <?php $src = 'https://www.youtube.com/embed/' . $id; ?>
    <iframe width="560" height="315" src="<?= $src ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div></br>