<section class="main-content">
	<div class="row">
		<div class="span5">
			<h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
			<form action="#" method="post">
				<input type="hidden" name="next" value="/">
				<fieldset>
					<div class="control-group">
						<label class="control-label">Username</label>
						<div class="controls">
							<input type="text" placeholder="Enter your username" id="username" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Password</label>
						<div class="controls">
							<input type="password" placeholder="Enter your password" id="password" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<input tabindex="3" class="btn btn-inverse large" type="submit" value="Sign into your account">
						<a onclick="_login();" class="btn btn-inverse large">Sign into your FaceBook<a>
								<hr>
								<p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="span7">
			<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
			<form action="#" method="post" class="form-stacked">
				<fieldset>
					<div class="control-group">
						<label class="control-label">Username</label>
						<div class="controls">
							<input type="text" placeholder="Enter your username" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Email address:</label>
						<div class="controls">
							<input type="password" placeholder="Enter your email" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Password:</label>
						<div class="controls">
							<input type="password" placeholder="Enter your password" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<p>Now that we know who you are. I'm not a mistake! In a comic, you know how you can tell who the arch-villain's going to be?</p>
					</div>
					<hr>
					<div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account"></div>
				</fieldset>
			</form>
		</div>
	</div>
</section>

<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId: '848795522673086',
			cookie: true,
			xfbml: true,
			version: 'v3.1'
		});
		FB.AppEvents.logPageView();
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function statusChangeCallback(response) {
		if (response.status === 'connected') {
			console.log('Đã xác thực thành công');
		} else if (response.status === 'not_authorized') {
			console.log('Xác thực chưa thành công');
		}
	}

	function _login() {
		FB.login(function(response) {
			// Xử lý các kết quả
			if (response.status === 'connected') {
				getFbUserData();
			}
		}, {
			scope: 'public_profile,email'
		});
	}

	function getFbUserData() {
		FB.api('/me', {
				locale: 'en_US',
				fields: 'id,first_name,last_name,email,picture'
			},
			function(response) {
				saveUserData(response);
			});
	}

	function saveUserData(userData) {
		$.post(
			'/users/loginFB', {
				oauth_provider: 'facebook',
				userData: JSON.stringify(userData)
			},
			function(data) {
				if (data === false) {
					alert('Login failed');
				} else {
					alert('Login success');
				}

			}
		);
	}
</script>