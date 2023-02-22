<?php if ($c->attaches['image']['0'] != '') : ?>
	<div class="text-image clearfix">
		<div class="image <?= $c->image_pos == 'left' ? 'image-left' : 'image-right' ?>">
			<img src="<?= $c->attaches['image']['0']; ?>" alt="" width="450" height="290" loading="lazy" decoding="async">
		</div>
		<div class="text">
			<p>
				<?= nl2br(h($c->content)) ?>
			</p>
		</div>
	</div>
<?php endif; ?>