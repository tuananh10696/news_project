<?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>
	<ul class="paging">
		<?= $this->Paginator->prev('') ?>
		<?= $this->Paginator->numbers(['modulus' => 2, 'first' => 1, 'last' => 1]); ?>
		<?= $this->Paginator->next('') ?>
	</ul>
<?php endif; ?>