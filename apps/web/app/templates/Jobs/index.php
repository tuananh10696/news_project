<?php

use Cake\Utility\Hash;

?>

<main id="main">
	<!-- ======= Search Results ======= -->
	<section id="search-result" class="search-result">
		<div class="container">
			<div class="row">
				<div class="col-md-9">

					<div class="store-sort">
						<?php $category = Hash::combine($category, '{n}.id', '{n}.name');
						$peple_job_type = ['Tìm người', 'Tìm việc']
						?>
						<?= $this->Form->create(null, ['type' => 'GET', 'name' => 'search_job_form']) ?>
						<label>
							<?= $this->Form->input('peple_job_type', ['value' => $search_type_job, 'type' => 'select', 'options' => $peple_job_type, 'class' => 'input-select']) ?>
						</label>
						<label>
							<?= $this->Form->input('job_type', ['empty' => 'Công việc', 'type' => 'select', 'options' => $category, 'class' => 'input-select']) ?>
						</label>
						<label>
							<?= $this->Form->input('prefectures', ['empty' => 'Địa điểm', 'type' => 'select', 'options' => $prefecture_list, 'class' => 'input-select']) ?>
						</label>
						<?php $this->Form->end() ?>
					</div>

					<?php foreach ($infos as $news_index_data) : ?>
						<div class="d-md-flex post-entry-2 small-img">
							<a href="/jobs/<?= $news_index_data->id ?>" class="me-4 thumbnail">
								<img src="<?= $news_index_data->attaches['image'][0] ?>" alt="" class="img-fluid thum_img">
							</a>
							<div>
								<div class="post-meta"><span class="date"><?= $news_index_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $news_index_data->start_datetime->format('Y.m.d') ?></span></div>
								<h3><a href="/jobs/<?= $news_index_data->id ?>"><?= h($news_index_data->title) ?></a></h3>
								<p><?= h($news_index_data->notes) ?></p>
								<div class="d-flex align-items-center author">
									<div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div>
									<div class="name">
										<h3 class="m-0 p-0">Wade Warren</h3>
									</div>
								</div>
							</div>
						</div>
					<?php endforeach; ?>

					<!-- Paging -->
					<div class="text-start py-4">
						<div class="custom-pagination">
							<?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>
								<?php if ($this->Paginator->hasPrev()) : ?><?= $this->Paginator->prev('') ?><?php endif; ?>
								<?= $this->Paginator->numbers(); ?>
								<?php if ($this->Paginator->hasNext()) : ?><?= $this->Paginator->next('') ?><?php endif; ?>
							<?php endif; ?>
						</div>
					</div><!-- End Paging -->

				</div>

				<div class="col-md-3">
					<!-- ======= Sidebar ======= -->
					<!-- Trending Section -->

					<div class="trending">
						<h3>Hot Jobs</h3>
						<ul class="trending-post">
							<li>
								<a href="single-post.html">
									<span class="number">1</span>
									<h3>The Best Homemade Masks for Face (keep the Pimples Away)</h3>
									<span class="author">Jane Cooper</span>
								</a>
							</li>
							<li>
								<a href="single-post.html">
									<span class="number">2</span>
									<h3>17 Pictures of Medium Length Hair in Layers That Will Inspire Your
										New Haircut</h3>
									<span class="author">Wade Warren</span>
								</a>
							</li>
							<li>
								<a href="single-post.html">
									<span class="number">3</span>
									<h3>13 Amazing Poems from Shel Silverstein with Valuable Life Lessons
									</h3>
									<span class="author">Esther Howard</span>
								</a>
							</li>
							<li>
								<a href="single-post.html">
									<span class="number">4</span>
									<h3>9 Half-up/half-down Hairstyles for Long and Medium Hair</h3>
									<span class="author">Cameron Williamson</span>
								</a>
							</li>
							<li>
								<a href="single-post.html">
									<span class="number">5</span>
									<h3>Life Insurance And Pregnancy: A Working Mom’s Guide</h3>
									<span class="author">Jenny Wilson</span>
								</a>
							</li>
						</ul>
					</div>


					<!-- End Categories -->

				</div>

			</div>
		</div>
	</section> <!-- End Search Result -->

</main>
<!-- End #main -->

<?php $this->start('script') ?>
<script>
	$(document).ready(function() {
		$('select').on('change', function() {
			document.forms['search_job_form'].submit();
		});
	});
</script>
<?php $this->end('script') ?>