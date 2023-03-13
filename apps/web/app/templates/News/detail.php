<main id="main">
	<section class="single-post-content">
		<div class="container">
			<div class="row">
				<div class="col-md-9 post-content" data-aos="fade-up">

					<!-- ======= Single Post Content ======= -->
					<div class="single-post">
						<div class="post-meta"><span class="date"><?= $info->category->name ?></span> <span class="mx-1">•</span> <span><?= $info->start_datetime->format('Y.m.d') ?></span></div>
						<h1 class="mb-5"><?= $info->title ?></h1>
						<?php foreach ($contents as $content) : ?>
							<?= $this->element('info/content_' . $content['block_type'], ['c' => $content]); ?>
						<?php endforeach; ?>

					</div>
					<!-- End Single Post Content -->


					<!-- ======= Comments Form ======= -->
					<div class="row justify-content-center mt-5">

						<div class="col-lg-12">
							<h5 class="comment-title">Leave a Comment</h5>
							<div class="row">
								<div class="col-12 mb-3">
									<!-- <label for="comment-message">Comment</label> -->
									<textarea class="form-control" id="comment-message" placeholder="Enter your Comment" cols="30" rows="3"></textarea>
								</div>
								<div class="col-12">
									<input type="submit" class="btn btn-primary" value="Post comment">
								</div>
							</div>
						</div>
					</div><!-- End Comments Form -->

				</div>


				<div class="col-md-3">
					<!-- ======= Sidebar ======= -->
					<div class="aside-block">
						<!-- Start Categories -->
						<div class="aside-block">
							<h3 class="aside-title">Categories</h3>
							<ul class="aside-links list-unstyled">
								<?php foreach ($category as $category_data) : ?>
									<li><a href="/news?category_id=<?= $category_data->id ?>"><i class="bi bi-chevron-right"></i><?= h($category_data->name) ?></a></li>
								<?php endforeach; ?>
							</ul>
						</div>
						<!-- End Categories -->

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
								<img src="/assets/img/post-landscape-5.jpg" alt="" class="img-fluid">
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

<?php $this->start('script') ?>
<script src="/user/common/js/render-news.js"></script>
<?php $this->end('script') ?>