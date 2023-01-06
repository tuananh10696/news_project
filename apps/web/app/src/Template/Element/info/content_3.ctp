<?php if ($c['attaches']['image']['0']) : ?>
	<?php $image = __('<img src="{0}" alt="" loading="lazy" decoding="async">', $c['attaches']['image']['0']); ?>
	<?php $href = h($c['content']); ?>
	<?php $target = $c['option_value']; ?>

	<?php if ($href != '') : ?>
		<?= __('<a href="{0}" target="{1}">{2}</a>', $href, $target, $image) ?>
	<?php else : ?>
		<?= $image ?>
	<?php endif ?>
<?php endif; ?>