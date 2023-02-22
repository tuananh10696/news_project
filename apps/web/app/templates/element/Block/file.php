<ul class="list-icon">
	<?php $class = ['link-file--clr01', 'icon-pdf'] ?>
	<?php $class = in_array($c->file_extension, ['doc', 'docx'], true) ? ['link-file--clr02', 'icon-word'] : $class ?>
	<?php $class = in_array($c->file_extension, ['xls', 'xlsx'], true) ? ['link-file--clr03', 'icon-excel'] : $class ?>
	<?php [$classA, $classI] = $class ?>
	<li>
		<a class="link-file <?= $classA ?>" href="<?= $c->attaches['file'][0]; ?>" target="_blank" rel="noopener noreferrer">
			<i class="icon <?= $classI ?>"> </i><span> <?= h($c->file_name); ?></span>
		</a>
	</li>
</ul>