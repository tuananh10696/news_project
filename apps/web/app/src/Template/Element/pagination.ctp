<?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>

	<ul class="pagination justify-content-start">
		<?= $this->Paginator->prev('') ?>
		<?= $this->Paginator->numbers(); ?>
		<?= $this->Paginator->next('') ?>
	</ul>

<?php endif; ?>