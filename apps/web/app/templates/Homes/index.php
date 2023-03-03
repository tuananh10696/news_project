<main id="main">

	<!-- ======= Hero Slider Section ======= -->
	<section id="hero-slider" class="hero-slider">
		<div class="container-md" data-aos="fade-in">
			<div class="row">
				<div class="col-12">
					<div class="swiper sliderFeaturedPosts">
						<div class="swiper-wrapper">

							<?php foreach ($top_slide as $top_slide_data) : ?>
								<div class="swiper-slide">
									<a href="/news/<?= $top_slide_data['id'] ?>" class="img-bg d-flex align-items-end" style="background-image: url('<?= $top_slide_data['attaches']['image'][0] ?>');">
										<div class="img-bg-inner">
											<h2><?= h($top_slide_data['title']) ?></h2>
											<p><?= h($top_slide_data['notes']) ?></p>
										</div>
									</a>
								</div>
							<?php endforeach; ?>

						</div>
						<div class="custom-swiper-button-next">
							<span class="bi-chevron-right"></span>
						</div>
						<div class="custom-swiper-button-prev">
							<span class="bi-chevron-left"></span>
						</div>

						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- End Hero Slider Section -->


	<!-- ======= Post Grid Section ======= -->
	<section id="posts" class="posts">
		<div class="container" data-aos="fade-up">
			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>NEWS</h2>
				<div><a href="/news" class="more">All News</a></div>
			</div>
			<div class="row g-5">
				<div class="col-lg-4">

					<?php foreach ($doi_song as $id => $doi_song_data) : ?>
						<?php if ($id == 0) : ?>
							<div class="post-entry-1 lg border-bottom">
								<a href="/news/<?= $doi_song_data['id'] ?>"><img src="<?= $doi_song_data['attaches']['image'][0] ?>" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date"><?= $doi_song_data['category']['name'] ?></span>
									<span class="mx-1">&bullet;</span> <span><?= $doi_song_data['start_datetime']->format('Y.m.d') ?></span>
								</div>
								<h2><a href="/news/<?= $doi_song_data['id'] ?>"><?= h($doi_song_data['title']) ?></a></h2>
								<p class="mb-4 d-block"><?= h($doi_song_data['notes']) ?></p>

								<div class="d-flex align-items-center author">
									<!-- <div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div> -->
									<a href="">
										<div class="name">
											<h3 class="m-0 p-0">Cameron Williamson</h3>
										</div>
								</div>
								</a>
							</div>
						<?php endif; ?>
						<div class="post-entry-1 border-bottom">
							<div class="post-meta"><span class="date"><?= $doi_song_data['category']['name'] ?></span> <span class="mx-1">&bullet;</span> <span><?= $doi_song_data['start_datetime']->format('Y.m.d') ?></span></div>
							<h2 class="mb-2"><a href="/news/<?= $doi_song_data['id'] ?>"><?= h($doi_song_data['title']) ?></a></h2>
							<div class="d-flex align-items-center author">
								<!-- <div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div> -->
								<div class="name">
									<h3 class="m-0 p-0">Cameron Williamson</h3>
								</div>
							</div>
						</div>
						<?php ?>
					<?php endforeach; ?>
				</div>

				<div class="col-lg-8">
					<div class="row g-5">

						<div class="col-lg-4 border-start custom-border">
							<?php foreach ($giai_tri as $id => $giai_tri_data) : ?>
								<div class="post-entry-1">
									<a href="/news/<?= $giai_tri_data['id'] ?>"><img src="<?= $giai_tri_data['attaches']['image'][0] ?>" alt="" class="img-fluid thum_img"></a>
									<div class="post-meta"><span class="date"><?= $giai_tri_data['category']['name'] ?></span> <span class="mx-1">&bullet;</span> <span><?= $giai_tri_data['start_datetime']->format('Y.m.d') ?></span></div>
									<h2><a href="/news/<?= $giai_tri_data['id'] ?>"><?= h($giai_tri_data['title']) ?></a></h2>
									<div class="d-flex align-items-center author">
										<!-- <div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div> -->
										<div class="name">
											<h3 class="m-0 p-0">Cameron Williamson</h3>
										</div>
									</div>
								</div>
							<?php endforeach; ?>
						</div>

						<div class="col-lg-4 border-start custom-border">
							<?php foreach ($hoc_tap as $id => $hoc_tap_lam_viec_data) : ?>
								<div class="post-entry-1">
									<a href="/news/<?= $hoc_tap_lam_viec_data['id'] ?>"><img src="<?= $hoc_tap_lam_viec_data['attaches']['image'][0] ?>" alt="" class="img-fluid thum_img"></a>
									<div class="post-meta"><span class="date"><?= $hoc_tap_lam_viec_data['category']['name'] ?></span> <span class="mx-1">&bullet;</span> <span><?= $hoc_tap_lam_viec_data['start_datetime']->format('Y.m.d') ?></span></div>
									<h2><a href="/news/<?= $hoc_tap_lam_viec_data['id'] ?>"><?= h($hoc_tap_lam_viec_data['title']) ?></a></h2>
									<div class="d-flex align-items-center author">
										<!-- <div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div> -->
										<div class="name">
											<h3 class="m-0 p-0">Cameron Williamson</h3>
										</div>
									</div>
								</div>
							<?php endforeach; ?>
						</div>

						<!-- Trending Section -->
						<div class="col-lg-4 border-start custom-border">

							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab" role="tablist">
								<li class="nav-item-top" role="presentation">
									<button class="nav-link active" id="pills-popular-tab" data-bs-toggle="pill" data-bs-target="#pills-popular" type="button" role="tab" aria-controls="pills-popular" aria-selected="true">All</button>
								</li>
								<li class="nav-item-top" role="presentation">
									<button class="nav-link" id="pills-trending-tab" data-bs-toggle="pill" data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending" aria-selected="false">Trending</button>
								</li>
								<li class="nav-item-top" role="presentation">
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
											<span class="author mb-3 d-block">Jenny Wilson</span>
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

					</div>
					<!-- End Trending Section -->
				</div>
			</div>

		</div> <!-- End .row -->
		</div>
	</section> <!-- End Post Grid Section -->




	<!-- ======= Lifestyle Category Section ======= -->
	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>Lifestyle</h2>
				<div><a href="category.html" class="more">See All Lifestyle</a></div>
			</div>

			<div class="row g-5">
				<div class="col-lg-4">
					<div class="post-entry-1 lg">
						<a href="single-post.html"><img src="assets/img/post-landscape-8.jpg" alt="" class="img-fluid thum_img"></a>
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2><a href="single-post.html">11 Work From Home Part-Time Jobs You Can Do Now</a></h2>
						<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus exercitationem? Nihil tempore odit ab minus eveniet praesentium, similique blanditiis molestiae ut saepe perspiciatis officia nemo, eos quae cumque. Accusamus fugiat architecto rerum animi atque eveniet, quo, praesentium dignissimos</p>

						<div class="d-flex align-items-center author">
							<div class="photo"><img src="assets/img/person-7.jpg" alt="" class="img-fluid thum_img"></div>
							<div class="name">
								<h3 class="m-0 p-0">Esther Howard</h3>
							</div>
						</div>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1">
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

				</div>

				<div class="col-lg-8">
					<div class="row g-5">
						<div class="col-lg-4 border-start custom-border">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-6.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">Let’s Get Back to Work, New York</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 17th '22</span></div>
								<h2><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-4.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Mar 15th '22</span></div>
								<h2><a href="single-post.html">Why Craigslist Tampa Is One of The Most Interesting Places On the Web?</a></h2>
							</div>
						</div>
						<div class="col-lg-4 border-start custom-border">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-3.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">6 Easy Steps To Create Your Own Cute Merch For Instagram</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-2.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Mar 1st '22</span></div>
								<h2><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-1.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">5 Great Startup Tips for Female Founders</a></h2>
							</div>
						</div>
						<div class="col-lg-4 border-start custom-border">

							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab" role="tablist">
								<li class="nav-item-top" role="presentation">
									<button class="nav-link active" id="pills-popular-tab" data-bs-toggle="pill" data-bs-target="#pills-popular" type="button" role="tab" aria-controls="pills-popular" aria-selected="true">All</button>
								</li>
								<li class="nav-item-top" role="presentation">
									<button class="nav-link" id="pills-trending-tab" data-bs-toggle="pill" data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending" aria-selected="false" tabindex="-1">Trending</button>
								</li>
								<li class="nav-item-top" role="presentation">
									<button class="nav-link" id="pills-latest-tab" data-bs-toggle="pill" data-bs-target="#pills-latest" type="button" role="tab" aria-controls="pills-latest" aria-selected="false" tabindex="-1">Popular</button>
								</li>
							</ul>

							<div class="tab-content" id="pills-tabContent">

								<!-- Popular -->
								<div class="tab-pane fade active show" id="pills-popular" role="tabpanel" aria-labelledby="pills-popular-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Nature</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/2">Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</a></h2>
										<div class="d-flex align-items-center author">
											<div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div>
											<div class="name">
												<h3 class="m-0 p-0">Cameron Williamson</h3>
											</div>
										</div>
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Travel</span> <span class="mx-1">•</span> <span>2023.03.02</span></div>
										<h2 class="mb-2"><a href="/news/7">rwerwe</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Nature</span> <span class="mx-1">•</span> <span>2023.03.02</span></div>
										<h2 class="mb-2"><a href="/news/6">news</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Life</span> <span class="mx-1">•</span> <span>2023.03.02</span></div>
										<h2 class="mb-2"><a href="/news/5">test</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Life</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/4">Ba Bể có những dãy núi đá vôi dựng đứng</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								</div>
								<!-- End Popular -->

								<!-- Trending -->
								<div class="tab-pane fade" id="pills-trending" role="tabpanel" aria-labelledby="pills-trending-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Nature</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/2">Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Travel</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/1">10 'kỳ quan thiên nhiên' đẹp nhất Việt Nam</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Nature</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/3">testttt</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								</div> <!-- End Trending -->

								<!-- Latest -->
								<div class="tab-pane fade" id="pills-latest" role="tabpanel" aria-labelledby="pills-latest-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta"><span class="date">Life</span> <span class="mx-1">•</span> <span>2023.02.22</span></div>
										<h2 class="mb-2"><a href="/news/4">Ba Bể có những dãy núi đá vôi dựng đứng</a></h2>
										<!-- <span class="author mb-3 d-block">Jenny Wilson</span> -->
									</div>
								</div> <!-- End Latest -->

							</div>

						</div>
					</div>
				</div>

			</div> <!-- End .row -->
		</div>
	</section><!-- End Lifestyle Category Section -->

	<!-- ======= Culture Category Section ======= -->
	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>Culture</h2>
				<div><a href="category.html" class="more">See All Culture</a></div>
			</div>

			<div class="row">
				<div class="col-md-9">

					<div class="d-lg-flex post-entry-2">
						<a href="single-post.html" class="me-4 thumbnail mb-4 mb-lg-0 d-inline-block">
							<img src="assets/img/post-landscape-6.jpg" alt="" class="img-fluid thum_img">
						</a>
						<div>
							<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
							<h3><a href="single-post.html">What is the son of Football Coach John Gruden, Deuce Gruden doing Now?</a></h3>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio placeat exercitationem magni voluptates dolore. Tenetur fugiat voluptates quas, nobis error deserunt aliquam temporibus sapiente, laudantium dolorum itaque libero eos deleniti?</p>
							<div class="d-flex align-items-center author">
								<div class="photo"><img src="assets/img/person-2.jpg" alt="" class="img-fluid thum_img"></div>
								<div class="name">
									<h3 class="m-0 p-0">Wade Warren</h3>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4">
							<div class="post-entry-1 border-bottom">
								<a href="single-post.html"><img src="assets/img/post-landscape-1.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">11 Work From Home Part-Time Jobs You Can Do Now</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
								<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus</p>
							</div>

							<div class="post-entry-1">
								<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">5 Great Startup Tips for Female Founders</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-2.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
								<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>
				</div>
			</div>
		</div>
	</section><!-- End Culture Category Section -->

	<!-- ======= Business Category Section ======= -->
	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>Business</h2>
				<div><a href="category.html" class="more">See All Business</a></div>
			</div>

			<div class="row">
				<div class="col-md-9 order-md-2">

					<div class="d-lg-flex post-entry-2">
						<a href="single-post.html" class="me-4 thumbnail d-inline-block mb-4 mb-lg-0">
							<img src="assets/img/post-landscape-3.jpg" alt="" class="img-fluid thum_img">
						</a>
						<div>
							<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
							<h3><a href="single-post.html">What is the son of Football Coach John Gruden, Deuce Gruden doing Now?</a></h3>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio placeat exercitationem magni voluptates dolore. Tenetur fugiat voluptates quas, nobis error deserunt aliquam temporibus sapiente, laudantium dolorum itaque libero eos deleniti?</p>
							<div class="d-flex align-items-center author">
								<div class="photo"><img src="assets/img/person-4.jpg" alt="" class="img-fluid thum_img"></div>
								<div class="name">
									<h3 class="m-0 p-0">Wade Warren</h3>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4">
							<div class="post-entry-1 border-bottom">
								<a href="single-post.html"><img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">11 Work From Home Part-Time Jobs You Can Do Now</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
								<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus</p>
							</div>

							<div class="post-entry-1">
								<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">5 Great Startup Tips for Female Founders</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-7.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
								<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>
				</div>
			</div>
		</div>
	</section><!-- End Business Category Section -->

	<!-- ======= Lifestyle Category Section ======= -->
	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>Lifestyle</h2>
				<div><a href="category.html" class="more">See All Lifestyle</a></div>
			</div>

			<div class="row g-5">
				<div class="col-lg-4">
					<div class="post-entry-1 lg">
						<a href="single-post.html"><img src="assets/img/post-landscape-8.jpg" alt="" class="img-fluid thum_img"></a>
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2><a href="single-post.html">11 Work From Home Part-Time Jobs You Can Do Now</a></h2>
						<p class="mb-4 d-block">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero temporibus repudiandae, inventore pariatur numquam cumque possimus exercitationem? Nihil tempore odit ab minus eveniet praesentium, similique blanditiis molestiae ut saepe perspiciatis officia nemo, eos quae cumque. Accusamus fugiat architecto rerum animi atque eveniet, quo, praesentium dignissimos</p>

						<div class="d-flex align-items-center author">
							<div class="photo"><img src="assets/img/person-7.jpg" alt="" class="img-fluid thum_img"></div>
							<div class="name">
								<h3 class="m-0 p-0">Esther Howard</h3>
							</div>
						</div>
					</div>

					<div class="post-entry-1 border-bottom">
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

					<div class="post-entry-1">
						<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
						<h2 class="mb-2"><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
						<span class="author mb-3 d-block">Jenny Wilson</span>
					</div>

				</div>

				<div class="col-lg-8">
					<div class="row g-5">
						<div class="col-lg-4 border-start custom-border">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-6.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">Let’s Get Back to Work, New York</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 17th '22</span></div>
								<h2><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-4.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Mar 15th '22</span></div>
								<h2><a href="single-post.html">Why Craigslist Tampa Is One of The Most Interesting Places On the Web?</a></h2>
							</div>
						</div>
						<div class="col-lg-4 border-start custom-border">
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-3.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">6 Easy Steps To Create Your Own Cute Merch For Instagram</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-2.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Mar 1st '22</span></div>
								<h2><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
							</div>
							<div class="post-entry-1">
								<a href="single-post.html"><img src="assets/img/post-landscape-1.jpg" alt="" class="img-fluid thum_img"></a>
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2><a href="single-post.html">5 Great Startup Tips for Female Founders</a></h2>
							</div>
						</div>
						<div class="col-lg-4">

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

							<div class="post-entry-1 border-bottom">
								<div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
								<h2 class="mb-2"><a href="single-post.html">10 Life-Changing Hacks Every Working Mom Should Know</a></h2>
								<span class="author mb-3 d-block">Jenny Wilson</span>
							</div>

						</div>
					</div>
				</div>

			</div> <!-- End .row -->
		</div>
	</section><!-- End Lifestyle Category Section -->

</main><!-- End #main -->