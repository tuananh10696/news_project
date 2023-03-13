<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title><?= $__title__ ?></title>
	<meta content="<?= $__title__ ?>" name="keywords">

	<meta name="Description" content="<?= $__description__ ?>">
	<meta property="og:type" content="website">
	<meta property="og:description" content="<?= $__description__ ?>">
	<meta property="og:title" content="<?= $__title__ ?>">
	<meta property="og:url" content="">
	<meta property="og:image" content="">
	<meta property="og:locale" content="ja_JP">
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:description" content="<?= $__description__ ?>">

	<!-- Favicons -->
	<link href="assets/img/favicon.png" rel="icon">
	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="/assets/vendor/aos/aos.css" rel="stylesheet">

	<!-- Template Main CSS Files -->
	<link href="/assets/css/variables.css" rel="stylesheet">
	<link href="/assets/css/main.css" rel="stylesheet">
	<?= $this->fetch('css'); ?>

	<!-- =======================================================
  * Template Name: ZenBlog - v1.3.0
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div class="container-fluid container-xl d-flex align-items-center justify-content-between">

			<a href="/" class="logo d-flex align-items-center">
				<!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="assets/img/logo.png" alt=""> -->
				<h1>Genki-Vn</h1>
			</a>

			<nav id="navbar" class="navbar">
				<ul>

					<li class="dropdown"><a href="/news"><span>Tin Tức</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="/news">All</a></li>
							<?php foreach ($category as $category_data) : ?>
								<li><a href="/news?category_id=<?= $category_data->id ?>"><?= h($category_data->name) ?></a></li>
							<?php endforeach; ?>
							<!-- <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
								<ul>
									<li><a href="#">Deep Drop Down 1</a></li>
									<li><a href="#">Deep Drop Down 2</a></li>
									<li><a href="#">Deep Drop Down 3</a></li>
									<li><a href="#">Deep Drop Down 4</a></li>
									<li><a href="#">Deep Drop Down 5</a></li>
								</ul>
							</li> -->
						</ul>
					</li>
					<li class="dropdown"><a href="/jobs/"><span>Tìm Việc</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="/jobs?type=nguoi_tim_viec">Người Tìm Việc</a></li>
							<li><a href="/jobs?type=viec_tim_nguoi">Việc Tìm Người</a></li>
					</li>
				</ul>
				</li>
				<li><a href="/news">Videos</a></li>
				<li><a href="/news">Đăng Bài</a></li>
				<li><a href="about.html">Genki-Vn</a></li>
				<li><a href="contact.html">Contact</a></li>
				<li class="dropdown"><a href="/accounts/" class="mx-2"><span class="bi-person-circle"> <?= $this->Session->read('user_data') != '' ? $this->Session->read('user_data')['name'] : ' Đăng Nhập' ?></span></a>
					<ul>
						<?php if ($this->Session->read('user_data') == '') : ?>
							<li><a href="/accounts/">Đăng Nhập</a></li>
							<li><a href="/accounts/register/">Tạo Tài Khoản</a></li>
						<?php else : ?>
							<li><a href="/accounts/user/">Trang Cá Nhân</a></li>
							<li><a href="/accounts/user/">Đăng Bài</a></li>
							<li><a href="/accounts/logout/">Đăng Xuất</a></li>
						<?php endif; ?>
					</ul>
				</li>
				</ul>
			</nav>
			<!-- .navbar -->

			<div class="position-relative">
				<a href="#" class="mx-2"><span class="bi-youtube"></span></a>
				<a href="#" class="mx-2"><span class="bi-facebook"></span></a>

				<a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
				<!-- <a href="#" class="mx-2"><span class="bi-person-circle"></span></a> -->

				<i class="bi bi-list mobile-nav-toggle"></i>

				<!-- ======= Search Form ======= -->
				<div class="search-form-wrap js-search-form-wrap">
					<form action="search-result.html" class="search-form">
						<span class="icon bi-search"></span>
						<input type="text" placeholder="Search" class="form-control">
						<button class="btn js-search-close"><span class="bi-x"></span></button>
					</form>
				</div><!-- End Search Form -->

			</div>

		</div>

	</header><!-- End Header -->

	<?= $this->fetch('content'); ?>

	<!-- ======= Footer ======= -->
	<?php if ($slug != 'login') : ?>
		<footer id="footer" class="footer">
			<div class="footer-content">
				<div class="container">

					<div class="row g-5">
						<div class="col-lg-4">
							<h3 class="footer-heading">About ZenBlog</h3>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam ab, perspiciatis beatae autem deleniti voluptate nulla a dolores, exercitationem eveniet libero laudantium recusandae officiis qui aliquid blanditiis omnis quae. Explicabo?</p>
							<p><a href="about.html" class="footer-link-more">Learn More</a></p>
						</div>
						<div class="col-6 col-lg-2">
							<h3 class="footer-heading">Navigation</h3>
							<ul class="footer-links list-unstyled">
								<li><a href="index.html"><i class="bi bi-chevron-right"></i> Home</a></li>
								<li><a href="index.html"><i class="bi bi-chevron-right"></i> Blog</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Categories</a></li>
								<li><a href="single-post.html"><i class="bi bi-chevron-right"></i> Single Post</a></li>
								<li><a href="about.html"><i class="bi bi-chevron-right"></i> About us</a></li>
								<li><a href="contact.html"><i class="bi bi-chevron-right"></i> Contact</a></li>
							</ul>
						</div>
						<div class="col-6 col-lg-2">
							<h3 class="footer-heading">Categories</h3>
							<ul class="footer-links list-unstyled">
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Business</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Culture</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Sport</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Food</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Politics</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Celebrity</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Startups</a></li>
								<li><a href="category.html"><i class="bi bi-chevron-right"></i> Travel</a></li>

							</ul>
						</div>

						<div class="col-lg-4">
							<h3 class="footer-heading">Recent Posts</h3>

							<ul class="footer-links footer-blog-entry list-unstyled">
								<li>
									<a href="single-post.html" class="d-flex align-items-center">
										<img src="/assets/img/post-sq-1.jpg" alt="" class="img-fluid me-3">
										<div>
											<div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
											<span>5 Great Startup Tips for Female Founders</span>
										</div>
									</a>
								</li>

								<li>
									<a href="single-post.html" class="d-flex align-items-center">
										<img src="/assets/img/post-sq-2.jpg" alt="" class="img-fluid me-3">
										<div>
											<div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
											<span>What is the son of Football Coach John Gruden, Deuce Gruden doing Now?</span>
										</div>
									</a>
								</li>

								<li>
									<a href="single-post.html" class="d-flex align-items-center">
										<img src="/assets/img/post-sq-3.jpg" alt="" class="img-fluid me-3">
										<div>
											<div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
											<span>Life Insurance And Pregnancy: A Working Mom’s Guide</span>
										</div>
									</a>
								</li>

								<li>
									<a href="single-post.html" class="d-flex align-items-center">
										<img src="/assets/img/post-sq-4.jpg" alt="" class="img-fluid me-3">
										<div>
											<div class="post-meta d-block"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
											<span>How to Avoid Distraction and Stay Focused During Video Calls?</span>
										</div>
									</a>
								</li>

							</ul>

						</div>
					</div>
				</div>
			</div>

			<div class="footer-legal">
				<div class="container">

					<div class="row justify-content-between">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							<div class="copyright">
								© Copyright <strong><span>ZenBlog</span></strong>. All Rights Reserved
							</div>

							<div class="credits">
								<!-- All the links in the footer should remain intact. -->
								<!-- You can delete the links only if you purchased the pro version. -->
								<!-- Licensing information: https://bootstrapmade.com/license/ -->
								<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
								Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
							</div>

						</div>

						<div class="col-md-6">
							<div class="social-links mb-3 mb-lg-0 text-center text-md-end">
								<a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
								<a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
								<a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
								<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
							</div>

						</div>

					</div>

				</div>
			</div>

		</footer>
	<?php endif; ?>
	<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/assets/vendor/aos/aos.js"></script>
	<script src="/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/user/common/js/jquery.js"></script>
	<script src="/assets/js/main.js"></script>
	<?= $this->fetch('script'); ?>

</body>

</html>