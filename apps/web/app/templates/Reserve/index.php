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
					<li class="active"> <span>入力</span></li>
					<li> <span>確認</span></li>
					<li> <span>完了</span></li>
				</ul>
				<p class="c-form__head">塩谷市は、移住に関するご相談をお受けしています。<br class="show_sp">以下フォームに必要事項をご入力ください。</p>
				<?= $this->Form->create($contact_form, ['name' => 'form', 'type' => 'post', 'class' => 'c-form h-adr', 'templates' => $form_templates]); ?>
				<?= $this->Form->input('action', ['type' => 'hidden', 'value' => 'confirm']); ?>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="name">お名前</label>
					<div class="c-form__ct">
						<?= $this->Form->input('name', ['type' => 'text', 'placeholder' => 'お名前', 'maxlength' => 60]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="male">性別</label>
					<div class="c-form__ct c-form__ct--wrap">

						<?= $this->Form->input('gender', ['type' => 'radio', 'options' => $gender]); ?>

					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="age">年齢（歳）</label>
					<div class="c-form__ct">
						<?= $this->Form->input('age', ['type' => 'text', 'placeholder' => '35', 'maxlength' => 2]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<span class="p-country-name" style="display:none;">Japan</span>
					<label class="c-form__tt has-request" for="post_code">住所</label>
					<div class="c-form__ct">
						<div class="c-form__child">
							<label class="c-form__tt" for="post_code">郵便番号</label>
							<div class="c-form__child__ct">
								<?= $this->Form->input('post_code', ['class' => 'p-postal-code', 'type' => 'text', 'placeholder' => '3292292', 'maxlength' => 8]); ?>
								<p class="c-form__note">※郵便番号を入力してください。都道府県以降が自動入力されます。</p>
							</div>
						</div>
						<div class="c-form__child">
							<label class="c-form__tt" for="prefectures">都道府県</label>
							<div class="c-form__child__ct">
								<?= $this->Form->input('prefectures', ['empty' => '選択してください', 'type' => 'select', 'class' => 'p-region', 'options' => $prefecture_list, 'label' => false]) ?>
							</div>
						</div>
						<div class="c-form__child">
							<label class="c-form__tt" for="municipalities">市区町村</label>
							<div class="c-form__child__ct">
								<?= $this->Form->input('city', ['class' => 'p-locality', 'type' => 'text', 'placeholder' => '塩谷郡塩谷町', 'maxlength' => 100]); ?>
							</div>
						</div>
						<div class="c-form__child">
							<label class="c-form__tt" for="address">番地および建物名</label>
							<div class="c-form__child__ct">
								<?= $this->Form->input('building', ['class' => 'p-street-address p-extended-address', 'type' => 'text', 'placeholder' => '大字玉生741', 'maxlength' => 100]); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="phone_number">電話番号</label>
					<div class="c-form__ct">
						<?= $this->Form->input('tel', ['type' => 'text', 'placeholder' => '0000000000', 'maxlength' => 13]); ?>
						<p class="c-form__note">※ハイフン不要</p>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="email">メールアドレス</label>
					<div class="c-form__ct">
						<?= $this->Form->input('email', ['type' => 'text', 'placeholder' => 'shioya@sample.com', 'maxlength' => 100]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="profession">ご職業</label>
					<div class="c-form__ct">
						<?= $this->Form->input('profession', ['type' => 'select', 'empty' => '選択してください', 'options' => $profession]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="emigrating">現時点で移住の意思はありますか？</label>
					<div class="c-form__ct c-form__ct--wrap">
						<?= $this->Form->input('immigration', ['type' => 'radio', 'options' => $immigration]); ?>

					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="plan">移住後の同居予定者</label>
					<div class="c-form__ct">
						<?= $this->Form->input('immigration_people', ['cols' => 30, 'type' => 'textarea', 'placeholder' => '妻・子どもと計3人。
				※未定の場合は「未定」とご入力ください。"', 'maxlength' => 200, 'rows' => 10]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="inquiry">ご相談の種類</label>
					<div class="c-form__ct">
						<?= $this->Form->input('category', ['type' => 'select', 'empty' => '選択してください', 'options' => $category]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="consultation">ご相談の内容</label>
					<div class="c-form__ct">
						<?= $this->Form->input('content', ['cols' => 30, 'rows' => 10, 'type' => 'textarea', 'placeholder' => '1年以内に移住の計画をしており、同時に農業を始めたく、土地や住まいについて総合的に情報を得られる機会を探しています。', 'maxlength' => 1000]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt" for="emigrate">移住を希望する時期</label>
					<div class="c-form__ct">
						<?= $this->Form->input('immigration_time', ['type' => 'select', 'empty' => '選択してください',  'options' => $immigration_time]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt" for="region">移住を希望する塩谷町の地域または環境</label>
					<div class="c-form__ct">
						<?= $this->Form->input('region', ['cols' => 30, 'type' => 'textarea', 'placeholder' => '交通の弁の良い場所', 'maxlength' => 1000]); ?>
					</div>
				</div>
				<div class="c-form__row">
					<label class="c-form__tt has-request" for="occupation">移住後の職業について</label>
					<div class="c-form__ct">
						<?= $this->Form->input('occupation', ['type' => 'select', 'empty' => '選択してください', 'options' => $occupation]); ?>
					</div>
				</div>
				<div class="c-form__row c-form__footer">
					<div class="c-form__privacy">
						<input id="chk_privacy" type="hidden" name="chk_privacy" value="0">
						<?= $this->Form->input('chk_privacy', ['type' => 'checkbox', 'value' => '1', 'hiddenFiend' => false, 'id' => 'privacy', 'error' => false]); ?>
						<label for="privacy"> <a class="c-link" href="/privacy/"> <span class="text">プライバシーポリシー</span></a>に同意する</label>
						<?= $this->Form->error('chk_privacy'); ?>
					</div>
					<div class="c-form__btn">
						<button class="btn btn-primary" type="button" onclick="document.form.submit();">リンクボタン<i class="icon-arrow glyphs-arrow-right"></i></button>
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
<script src="/user/common/js/yubinbango.js"></script>
<?php $this->end('js') ?>