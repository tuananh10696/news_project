<?php if (!is_null($info_client)) : ?>
	<div class="customer">
		<h2 class="c-ttls"><span>導入先お客様情報</span></h2>
		<div class="customer-info">
			<figure class="customer-info__images">
				<img class="fit fit--contain" src="<?= $info_client->attaches['image']['0']; ?>" alt="<?= h($info_client->infos_img_alt); ?>" width="416" height="304" loading="lazy" decoding="async">
			</figure>
			<div class="customer-info__text">
				<dl>
					<dt>会社名</dt>
					<dd><?= h($info_client->info_append_items[0]->value_text); ?></dd>
				</dl>
				<dl>
					<dt>所在地</dt>
					<dd><?= h($info_client->info_append_items[1]->value_text); ?></dd>
				</dl>
				<?php $option_value = [$info_client->option_value1, $info_client->option_value2, $info_client->option_value3, $info_client->option_value4];
					?>
				<?php if (isset($info_client->option_value1) && !empty($info_client->option_value1)) : ?>
					<dl>
						<dt><?= h($info_client->option_value1) ?></dt>
						<dd><?= h($info_client->option_value2); ?></dd>
					</dl>
				<?php endif ?>
				<?php if (isset($info_client->option_value3) && !empty($info_client->option_value3)) : ?>
					<dl>
						<dt><?= h($info_client->option_value3) ?></dt>
						<dd><?= h($info_client->option_value4); ?></dd>
					</dl>
				<?php endif ?>
				<?php if ($info_client->info_append_items[2]->value_text != '') : ?>
					<dl>
						<dt>業種</dt>
						<dd><?= h($info_client->info_append_items[2]->value_text); ?></dd>
					</dl>
				<?php endif ?>
				<dl>
					<dt>Webサイト</dt>
					<dd><a href="<?= h($info_client->info_append_items[3]->value_text); ?>" target="_blank"><?= h($info_client->info_append_items[3]->value_text); ?></a></dd>
				</dl>
			</div>
		</div>
		<div class="customer-gallery">
			<?php
				foreach ($info_client->info_contents as $get_img) {
					$elements = [[$get_img->attaches['image'][0], $get_img->img_alt], [$get_img->attaches['image_2'][0], $get_img->img_alt_2], [$get_img->attaches['image_3'][0], $get_img->img_alt_3]];
					foreach ($elements as $img_data) {
						if ($img_data[0] != '') {
							echo '<img class="fit" src="' . $img_data[0] . '" alt="' . h($img_data[1]) . '" width="314" height="229" loading="lazy" decoding="async">';
						}
					}
				}
				?>
		</div>
	</div>
<?php endif ?>