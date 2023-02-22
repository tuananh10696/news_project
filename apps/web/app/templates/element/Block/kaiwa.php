<div class="box-comment">
	<div class="comment__image <?= $c->option_value3 == 'right' ? 'row-reverse' : '' ?>">
		<img src="<?= $c->attaches['image']['0'] != '' ? $c->attaches['image']['0'] : '/assets/images/common/no_img.jpg'; ?>" alt="" width="130" height="130" loading="lazy" decoding="async">
	</div>
	<div class="comment__text">
		<p>
			<?= nl2br(h($c->content)) ?>
		</p>
	</div>
</div>