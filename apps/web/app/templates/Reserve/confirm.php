<?php $this->start('css') ?>
<link rel="stylesheet" href="/assets/css/reserve.css?v=d090b7ba9dd5602a087ad4d39f10bbfc">
<?php $this->end('css') ?>

<main class="main" id="main">
	<div class="main__inner">
		<div class="mv">
			<div class="row mv__inner">
				<h2 class="mv__title">移住のご相談</h2>
			</div>
		</div>
		<div class="block-content">
			<div class="row__sm">
				<ul class="c-form__step">
					<li> <span>入力</span></li>
					<li class="active"> <span>確認</span></li>
					<li> <span>完了</span></li>
				</ul>
				<p class="c-form__head">ご入力内容をご確認の上、「送信する」ボタンを押してください</p>
				<?= $this->Form->create($contact_form, ['templates' => $form_templates, 'class' => 'c-form c-form__confirm']); ?>
				<dl class="c-form__row">
					<dt class="c-form__tt">お名前</dt>
					<dd class="c-form__ct"><?= h($form_data['name']) ?></dd>
					<?= $this->Form->input('name', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">性別</dt>
					<dd class="c-form__ct"><?= $gender[$form_data['gender']] ?></dd>
					<?= $this->Form->input('gender', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">年齢（歳）</dt>
					<dd class="c-form__ct"><?= h($form_data['age']) ?></dd>
					<?= $this->Form->input('age', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">住所</dt>
					<dd class="c-form__ct">
						<div class="c-form__child">
							<div class="c-form__tt">郵便番号</div>
							<div class="c-form__child__ct"><?= h($form_data['post_code']) ?></div>
							<?= $this->Form->input('post_code', ['type' => 'hidden']); ?>
						</div>
						<div class="c-form__child">
							<div class="c-form__tt">都道府県</div>
							<div class="c-form__child__ct"><?= h($form_data['prefectures']) ?></div>
							<?= $this->Form->input('prefectures', ['type' => 'hidden']); ?>
						</div>
						<div class="c-form__child">
							<div class="c-form__tt">市区町村</div>
							<div class="c-form__child__ct"><?= h($form_data['city']) ?></div>
							<?= $this->Form->input('city', ['type' => 'hidden']); ?>
						</div>
						<div class="c-form__child">
							<div class="c-form__tt">番地および建物名</div>
							<div class="c-form__child__ct"><?= h($form_data['building']) ?></div>
							<?= $this->Form->input('building', ['type' => 'hidden']); ?>
						</div>
					</dd>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">電話番号</dt>
					<dd class="c-form__ct"><?= h($form_data['tel']) ?></dd>
					<?= $this->Form->input('tel', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">メールアドレス</dt>
					<dd class="c-form__ct"><?= h($form_data['email']) ?></dd>
					<?= $this->Form->input('email', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">ご職業</dt>
					<dd class="c-form__ct"><?= $profession[$form_data['profession']] ?></dd>
					<?= $this->Form->input('profession', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">現時点で移住の意思はありますか？</dt>
					<dd class="c-form__ct"><?= $immigration[$form_data['immigration']] ?></dd>
					<?= $this->Form->input('immigration', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">移住後の同居予定者</dt>
					<dd class="c-form__ct"><?= nl2br(h($form_data['immigration_people'])) ?></dd>
					<?= $this->Form->input('immigration_people', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">ご相談の種類</dt>
					<dd class="c-form__ct"><?= $category[$form_data['category']] ?></dd>
					<?= $this->Form->input('category', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">ご相談の内容</dt>
					<dd class="c-form__ct"><?= nl2br(h($form_data['content'])) ?></dd>
					<?= $this->Form->input('content', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">移住を希望する時期</dt>
					<dd class="c-form__ct"><?= @$immigration_time[$form_data['immigration_time']] ?></dd>
					<?= $this->Form->input('immigration_time', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">移住を希望する塩谷町の地域または環境</dt>
					<dd class="c-form__ct"><?= nl2br(h($form_data['region'])) ?></dd>
					<?= $this->Form->input('region', ['type' => 'hidden']); ?>
				</dl>
				<dl class="c-form__row">
					<dt class="c-form__tt">移住後の職業について</dt>
					<dd class="c-form__ct"><?= $occupation[$form_data['occupation']] ?></dd>
					<?= $this->Form->input('occupation', ['type' => 'hidden']); ?>
				</dl>
				<div class="c-form__row c-form__footer">
					<div class="c-form__btn">
						<button class="btn btn-primary send" type="submit">送信する<i class="icon-arrow glyphs-arrow-right"></i></button>
					</div>
					<div class="c-form__back">
						<button class="c-link__back" type="button" onClick="location.href='/reserve'"> <i class="icon-arrow glyphs-arrow-left"></i><span class="text">入力画面へ戻る</span></button>
					</div>
				</div>
				<?= $this->Form->end() ?>
			</div>
		</div>
	</div>
	<div class="block-breadcrumb">
		<div class="row">
			<ul class="breadcrumb">
				<li><a href="/">トップ</a></li>
				<li><span>移住のご相談</span>
				</li>
			</ul>
		</div>
	</div>
</main>

<?php $this->start('js') ?>
<script src="/user/common/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//送信ボタンを押した際に送信ボタンを無効化する（連打による多数送信回避）
		var is_click = true;
		$('.send').click(function() {
			if (!is_click) return false;
			$(this).parents('form').submit();
			is_click = false;
		});
	});
</script>
<?php $this->end('js') ?>
