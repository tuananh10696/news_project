<?php $this->start('css') ?>
<link rel="stylesheet" href="/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<link href="/login/css/style.css" rel="stylesheet">
<link href="/login/css/style.css.map" rel="stylesheet">
<?php $this->end('css') ?>

<div class="main">
	<!-- Sing in  Form -->
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-image">
					<figure><img src="/login/images/daily-vn_.png" alt="sing up image"></figure>
					<a href="/accounts/register/" class="signup-image-link">Create an account</a>
				</div>

				<div class="signin-form">
					<h2 class="form-title">Sign up</h2>
					<?= $this->Form->create(null, ['name' => 'form', 'id' => 'login-form', 'class' => 'register-form']); ?>

					<div class="form-group">
						<label for="your_name"><i class="zmdi zmdi-email"></i></label>
						<?= $this->Form->input('email', ['type' => 'email', 'placeholder' => 'Your Email', 'maxlength' => 200, 'required', 'pattern' => '.{0}|.{10,200}', 'title' => 'Vui lòng nhập từ 10 đến 200  kí tự nhé.']); ?>
					</div>

					<div class="form-group">
						<label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
						<?= $this->Form->input('password', ['type' => 'password', 'placeholder' => 'Password', 'maxlength' => 100, 'required']); ?>
					</div>
					<div class="form-group">
						<input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
						<label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
					</div>
					<p class="txtErr"><?= @$err ?></p>

					<div class="form-group form-button">
						<input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
					</div>
					<?php $this->Form->end() ?>
					<div class="social-login">
						<span class="social-label">Or login with</span>
						<ul class="socials">
							<li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
							<li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
							<li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<?php $this->start('script') ?>
<script src="/assets/js/main.js"></script>
<?php $this->end('script') ?>