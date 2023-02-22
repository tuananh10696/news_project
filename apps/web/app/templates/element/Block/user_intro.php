<div class="box-profile">
	<div class="profile__image">
		<img src="<?= $c->attaches['image']['0'] != '' ? $c->attaches['image']['0'] : '/assets/images/common/no_img.jpg'; ?>" alt="" width="241" height="241" loading="lazy" decoding="async">
	</div>
	<div class="profile__text">
		<p class="profile__catch"><?= h($c->title) ?></p>
		<p><?= nl2br(h($c->content)) ?></p>
	</div>
</div>