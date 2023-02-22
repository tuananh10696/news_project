――――――――――――――――――――――――――――――――
このメッセージはお問い合わせ受付システムより自動送信されています。
このメールに心当たりのない場合やご不明な場合はご連絡ください。
――――――――――――――――――――――――――――――――

この度は、WEBサイトよりお問い合わせいただきまして、誠にありがとうございます。
ご送信いただきました内容は以下の通りでございます。


*************************************************
　お問い合わせ内容
*************************************************


【お名前】
<?= $form['name']; ?>　

【性別】
<?= @$list['gender'][$form['gender']]; ?>　

【年齢】
<?= $form['age']; ?>　

【住所】
〒<?= $form['post_code']; ?>　
<?= $form['prefectures'] ." ". $form['city'] ." ". $form['building']; ?>　

【電話番号】
<?= $form['tel']; ?>　

【メールアドレス】
<?= $form['email']; ?>　

【ご職業】
<?= @$list['profession'][$form['profession']]; ?>　

【現時点で移住の意思はありますか？】
<?= @$list['immigration'][$form['immigration']]; ?>　

【移住後の同居予定者】
<?= $form['immigration_people']; ?>　

【ご相談の種類】
<?= @$list['category'][$form['category']]; ?>　

【ご相談の内容】
<?= $form['content']; ?>　
<?php if ($form['immigration_time'] != '') : ?>

【移住を希望する時期】
<?= @$list['immigration_time'][$form['immigration_time']]; ?>　
<?php endif; ?>
<?php if ($form['region'] != '') : ?>

【移住を希望する塩谷町の地域または環境】
<?= $form['region']; ?>　
<?php endif; ?>

【移住後の職業について】
<?= @$list['occupation'][$form['occupation']]; ?>　