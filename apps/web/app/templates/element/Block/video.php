<?php if ($c->content != '') : ?>
	<?php if ($c->option_value3 == 'youtube') : ?>
		<?php $id = intval($c->option_value2) == 1 ? getIDofYTfromURL($c->content) : $c->content ?>
		<div class="box-movie">
			<div class="modal-trigger" data-movie="<?= $id ?>">
				<div class="thumb" style="display:flex; justify-content: center;">
					<img src="<?= __('https://i.ytimg.com/vi/{0}/maxresdefault.jpg', $id) ?>" alt="" width="900" height="506" loading="lazy" decoding="async"><i class="icon icon-play"></i>
				</div>
			</div>
		</div>
	<?php else : ?>
	<?php endif ?>
<?php endif ?>