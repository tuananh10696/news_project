<?php

namespace App\Form;

use Cake\Form\Schema;
use Cake\Validation\Validator;
use App\Controller\AppController;
use Cake\Event\EventInterface;
use Cake\Core\Configure;
use Cake\Mailer\Mailer;

class ContactForm extends AppForm
{
    protected function _buildSchema(Schema $schema): Schema
    {
        return $schema
            ->addField('name', 'string')
            ->addField('gender', 'string')
            ->addField('age', 'string')
            ->addField('post_code', 'string')
            ->addField('prefectures', 'string')
            ->addField('city', 'string')
            ->addField('building', 'string')
            ->addField('tel', 'string')
            ->addField('email', 'string')
            ->addField('profession', 'string')
            ->addField('immigration', 'string')
            ->addField('immigration_people', 'string')
            ->addField('category', 'string')
            ->addField('content', 'string')
            ->addField('immigration_time', 'string')
            ->addField('region', 'string')
            ->addField('occupation', 'string')
            ->addField('chk_privacy', 'integer');
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator->setProvider('App', 'App\Validator\AppValidation');

        $validator
            ->notBlank('name', '※お名前をご入力ください')
            ->notEmptyString('name', '※お名前をご入力ください')
            ->maxLength('name', 60, '※60字以内でご入力ください')

            ->notEmptyString('gender', '※ご選択ください')

            ->notBlank('age', '※年齢をご入力ください')
            ->notEmptyString('age', '※年齢をご入力ください')
            ->maxLength('age', 2, '※2字以内でご入力ください')

            ->notBlank('postcode', '※郵便番号をご入力ください')
            ->notEmptyString('post_code', '※郵便番号をご入力ください')
            ->add('postcode', 'valid', ['rule' => [$this, 'checkPostcode'], 'message' => '郵便番号を正しくご入力ください'])

            ->notBlank('prefectures', '※ご選択ください')

            ->notBlank('city', '※市区町村をご入力ください')
            ->notEmptyString('city', '※市区町村をご入力ください')

            ->notBlank('building', '※番地および建物名をご入力ください')
            ->notEmptyString('building', '※番地および建物名をご入力ください')

            ->notBlank('profession', '※ご選択ください')

            ->notEmptyString('immigration', '※ご選択ください')

            ->notBlank('immigration_people', '※移住後の同居予定者をご入力ください')
            ->notEmptyString('immigration_people', '※移住後の同居予定者をご入力ください')
            ->maxLength('immigration_people', 200, '※200字以内でご入力ください')

            ->notBlank('category', '※ご選択ください')

            ->allowEmptyString('immigration_time')

            ->allowEmptyString('region')
            ->maxLength('region', 1000, '※1000字以内でご入力ください')

            ->notEmptyString('occupation', '※携帯電話番号をご入力ください')

            ->notBlank('email', '※メールアドレスをご入力ください')
            ->notEmptyString('email', '※メールアドレスをご入力ください')
            ->email('email', false, '※メールアドレスの形式が正しくありません')

            ->notBlank('tel', '※電話番号をご入力ください')
            ->notEmptyString('tel', '※電話番号をご入力ください')
            ->add(
                'tel',
                [
                    'custom' => [
                        'rule' => function ($value, $context) {
                            $v  = str_replace(['&nbsp;', '　', ' '], '', $value);
                            if (!preg_match('/^\d{10,11}$/', $v)) {
                                return '※電話番号の形式が正しくありません';
                            }
                            return true;
                        },
                    ],
                ],
            )

            ->notBlank('content', '※相談の内容をご入力ください')
            ->notEmptyString('content', '※相談の内容をご入力ください')
            ->maxLength('content', 1000, '※1000字以内でご入力ください')

            ->notBlank('chk_privacy', '※同意してください')
            ->add('chk_privacy', 'custom', ['rule' => [$this, 'checkIsPrivacy'], 'message' => '※同意してください']);

        return $validator;
    }

    private function _sendmail($form)
    {
        $contact_form = new ContactForm();

        // 文字化け対応
        // $form['content'] = _preventGarbledCharacters($form['content']);

        $to = ['bui.tuanAnh@caters.co.jp.co.jp'];
        $from = ['bui.tuanAnh@caters.co.jp.co.jp' => 'Daily-Vn'];

        $test_dev_local_server = (strpos($_SERVER["HTTP_HOST"], 'test') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'caters') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'loca') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'localhost') !== false);

        $is_honban = !Configure::read('debug') && !$test_dev_local_server;

        if ($is_honban) {
            // 本番の場合
            $to = ['bui.tuanAnh@caters.co.jp.co.jp'];
            $from = ['bui.tuanAnh@caters.co.jp.co.jp' => 'Daily-Vn'];
        }

        $info_email = new Mailer();
        $info_email->setCharset('ISO-2022-JP-MS')
            ->setEmailFormat('text')
            ->setFrom($from)
            ->setTo($to)
            ->setViewVars(['form' => $form])
            ->setSubject('【Daily-Vn】お問合せがありました')
            ->viewBuilder()
            ->setTemplate('contact_admin');

        $info_email->send();


        $thank_email = new Mailer();
        $thank_email->setCharset('ISO-2022-JP-MS')
            ->setEmailFormat('text')
            ->setViewVars(['form' => $form])
            ->setFrom($from)
            ->setTo($form['email'])
            ->setSubject('【Daily-Vn】お問い合わせありがとうございます')
            ->viewBuilder()
            ->setTemplate('contact_user');

        $thank_email->send();
    }
}
