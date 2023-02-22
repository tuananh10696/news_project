<?php

use App\Model\Entity\Info;
?>

<?php if (!empty($c->sub_contents)) : ?>
	<div class="box-bdb">

		<?php foreach ($c->sub_contents as $sub) : ?>
			<?php $block = isset(Info::$block_number2key_list[$sub->block_type]) ? strtolower(Info::$block_number2key_list[$sub->block_type]) : 'default' ?>

			<?php if (!is_show($sub)) : ?>
				<?= $this->element('Block/' . $block, ['c' => $sub]); ?>
			<?php endif ?>
		<?php endforeach; ?>
	</div>
<?php endif; ?>