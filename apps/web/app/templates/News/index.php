<main id="main">
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-9" data-aos="fade-up">
					<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab" role="tablist">
						<!-- Categories -->
						<li class="nav-item" role="presentation">
							<a href="/news" class="">
								<button style="color:var(--color-black);letter-spacing: 2px;" class="nav-link <?= $category_id == 0 ? 'categoryClass' : '' ?>" type="button" role="tab">All</button>
							</a>
						</li>
						<?php foreach ($category as $category_data) : ?>
							<li class="nav-item" role="presentation">
								<a href="/news?category_id=<?= $category_data->id ?>">
									<button style="color:var(--color-black);letter-spacing: 2px;" class="nav-link <?= $category_data->id == $category_id ? 'categoryClass' : '' ?>" type="button" role="tab"><?= $category_data->name ?></button>
								</a>
							</li>
						<?php endforeach; ?>
					</ul>

					<?php foreach ($infos as $news_index_data) : ?>
						<div class="d-md-flex post-entry-2 half">
							<a href="/news/<?= $news_index_data->id ?>" class="me-4 thumbnail">
								<img src="<?= $news_index_data->attaches['image'][0] ?>" alt="" class="img-fluid">
							</a>
							<div>
								<h3><a href="/news/<?= $news_index_data->id ?>"><?= $news_index_data->title ?></a></h3>
								<div class="post-meta"><span class="date"><?= $news_index_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $news_index_data->start_datetime->format('Y.m.d') ?></span></div>
								<p><?= $news_index_data->notes ?></p>
								<!-- <div class="d-flex align-items-center author">
									<div class="photo"><img src="assets/img/person-2.jpg" alt="" class="img-fluid"></div>
									<div class="name">
										<h3 class="m-0 p-0">Wade Warren</h3>
									</div>
								</div> -->
							</div>
						</div>
					<?php endforeach; ?>
					<div class="text-start py-4">
						<div class="custom-pagination">
							<?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>
								<?php if ($this->Paginator->hasPrev()) : ?><?= $this->Paginator->prev('') ?><?php endif; ?>
								<?= $this->Paginator->numbers(); ?>
								<?php if ($this->Paginator->hasNext()) : ?><?= $this->Paginator->next('') ?><?php endif; ?>
							<?php endif; ?>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<!-- ======= Sidebar ======= -->
					<div class="aside-block">
						<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="pills-popular-tab" data-bs-toggle="pill" data-bs-target="#pills-popular" type="button" role="tab" aria-controls="pills-popular" aria-selected="true">All</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-trending-tab" data-bs-toggle="pill" data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending" aria-selected="false">Trending</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-latest-tab" data-bs-toggle="pill" data-bs-target="#pills-latest" type="button" role="tab" aria-controls="pills-latest" aria-selected="false">Popular</button>
							</li>
						</ul>

						<div class="tab-content" id="pills-tabContent">

							<!-- Popular -->
							<div class="tab-pane fade show active" id="pills-popular" role="tabpanel" aria-labelledby="pills-popular-tab">
								<?php foreach ($all_news as $news_index_data) : ?>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date"><?= $news_index_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $news_index_data->start_datetime->format('Y.m.d') ?></span></div>
										<h2 class="mb-2"><a href="/news/<?= $news_index_data->id ?>"><?= h($news_index_data->title) ?></a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								<?php endforeach; ?>
							</div>
							<!-- End Popular -->

							<!-- Trending -->
							<div class="tab-pane fade" id="pills-trending" role="tabpanel" aria-labelledby="pills-trending-tab">
								<?php foreach ($opt_trending as $opt_trending_data) : ?>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date"><?= $opt_trending_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $opt_trending_data->start_datetime->format('Y.m.d') ?></span></div>
										<h2 class="mb-2"><a href="/news/<?= $opt_trending_data->id ?>"><?= h($opt_trending_data->title) ?></a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								<?php endforeach; ?>
							</div> <!-- End Trending -->

							<!-- Latest -->
							<div class="tab-pane fade" id="pills-latest" role="tabpanel" aria-labelledby="pills-latest-tab">
								<?php foreach ($opt_popular as $opt_popular_data) : ?>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date"><?= $opt_popular_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $opt_popular_data->start_datetime->format('Y.m.d') ?></span></div>
										<h2 class="mb-2"><a href="/news/<?= $opt_popular_data->id ?>"><?= h($opt_popular_data->title) ?></a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								<?php endforeach; ?>
							</div> <!-- End Latest -->

						</div>
					</div>

					<div class="aside-block">
						<h3 class="aside-title">Video</h3>
						<div class="video-post">
							<a href="https://www.youtube.com/watch?v=AiFfDjmd0jU" class="glightbox link-video">
								<span class="bi-play-fill"></span>
								<img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div><!-- End Video -->

					<div class="aside-block">
						<h3 class="aside-title">Tags</h3>
						<ul class="aside-tags list-unstyled">
							<?php $newArray = [];
							foreach ($all_news as $tags_data) {
								$newArray[] = $tags_data->value_text;
							} ?>

							<?php $newArray = array_unique($newArray);
							foreach ($newArray as $render_tags) : ?>
								<li><a href="/news?kw=<?= $render_tags ?>"><?= h($render_tags) ?></a></li>
							<?php endforeach; ?>
						</ul>
					</div><!-- End Tags -->

				</div>

			</div>
		</div>
	</section>
</main><!-- End #main -->

<div class="col-lg-4 border-start custom-border">
	<?php foreach ($all_news as $id => $all_news_data) : ?>
		<?php if ($id != 0 && $all_news_data['category_id'] === 2) : ?>
			<div class="post-entry-1">
				<a href="/news/<?= $all_news_data['id'] ?>"><img src="><?= $all_news_data['attaches']['image'][0] ?>" alt="" class="img-fluid"></a>
				<div class="post-meta"><span class="date"><?= $all_news_data['category']['name'] ?></span> <span class="mx-1">&bullet;</span> <span>><?= $all_news_data['start_datetime']->format('Y.m.d') ?></span></div>
				<h2><a href="/news/<?= $all_news_data['id'] ?>"><?= h($all_news_data['title']) ?></a></h2>
			</div>
		<?php endif; ?>
	<?php endforeach; ?>
</div>