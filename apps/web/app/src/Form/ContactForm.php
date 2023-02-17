<?php

namespace App\Form;

use Cake\Form\Schema;
use Cake\Validation\Validator;

class ContactForm extends AppForm
{

    const MAIL_SUBJECT_ADMIN = '【塩谷町移住定住促進サイト】お問い合わせがありました';
    const MAIL_SUBJECT_USER = '【塩谷町移住定住促進サイト】お問い合わせ受付完了';


    protected function _buildSchema(Schema $schema)
    {
        return $schema
            ->addField('name', 'string')
            ->addField('gender', 'string')
            ->addField('age', 'string')
            ->addField('zip', 'string')
            ->addField('region', 'string')
            ->addField('locality', 'string')
            ->addField('address', 'string')
            ->addField('tel', 'string')
            ->addField('email', 'string')
            ->addField('work', 'string')
            ->addField('migration', 'string')
            ->addField('migration_people', 'string')
            ->addField('category', 'string')
            ->addField('content', 'string')
            ->addField('after_migration_work', 'string')
            ->addField('privacy', 'integer');
    }


    protected function _buildValidator(Validator $validator)
    {
        $validator->setProvider('App', 'App\Validator\AppValidation');

        $validator
            ->notBlank('name', 'お名前をご入力ください。')
            ->notEmptyString('name', 'お名前をご入力ください。')
            ->add('name', 'length', ['rule' => ['maxLength', 50], 'message' => '50字以内で入力してください。']);

        $validator
            ->notBlank('gender', '性別をご入力ください。')
            ->notEmptyString('gender', '性別をご入力ください。');

        $validator
            ->notBlank('age', '年齢をご入力ください。')
            ->notEmptyString('age', '年齢をご入力ください。')
            ->add('age', 'length', ['rule' => ['maxLength', 2], 'message' => '2字以内で入力してください。']);

        $validator
            ->notBlank('zip', '必須項目です。')
            ->notEmptyString('zip', '必須項目です。')
            ->add('zip', 'valid', ['rule' => [$this, 'checkPostcode'], 'provider' => 'App', 'message' => '郵便番号を正しくご入力ください。']);

        $validator
            ->notBlank('region', '必須項目です')
            ->notEmptyString('region', '必須項目です')
            ->add('region', 'length', ['rule' => ['maxLength', 20], 'message' => '20字以内で入力してください。']);

        $validator
            ->notBlank('locality', '必須項目です')
            ->notEmptyString('locality', '必須項目です')
            ->add('locality', 'length', ['rule' => ['maxLength', 50], 'message' => '50字以内で入力してください。']);

        $validator
            ->notBlank('address', '必須項目です')
            ->notEmptyString('address', '必須項目です')
            ->add('address', 'length', ['rule' => ['maxLength', 50], 'message' => '50字以内で入力してください']);

        $validator
            ->notBlank('tel', 'お電話番号をご入力ください。')
            ->notEmptyString('tel', 'お電話番号をご入力ください。')
            ->add('tel', 'length', ['rule' => ['maxLength', 13], 'message' => '13字以内で入力してください。'])
            ->add('tel', 'checkTel', ['rule' => [$this, 'checkTel'], 'provider' => 'App', 'message' => 'お電話番号の形式が正しくありません。']);

        $validator
            ->notBlank('email', 'メールアドレスをご入力ください。')
            ->notEmptyString('email', 'メールアドレスをご入力ください。')
            ->email('email', false, 'メールアドレスの形式が正しくありません。');

        $validator
            ->notBlank('work', '選択ください。')
            ->notEmptyString('work', '選択ください。');

        $validator
            ->notBlank('migration', '選択ください。')
            ->notEmptyString('migration', '選択ください。');

        $validator
            ->notBlank('migration_people', 'ご入力ください。')
            ->notEmptyString('migration_people', 'ご入力ください。')
            ->add('migration_people', 'length', ['rule' => ['maxLength', 200], 'message' => '200字以内で入力してください。']);

        $validator
            ->notBlank('category', '選択ください。')
            ->notEmptyString('category', '選択ください。');

        $validator
            ->notBlank('content', 'ご入力ください。')
            ->notEmptyString('content', 'ご入力ください。')
            ->add('content', 'length', ['rule' => ['maxLength', 1000], 'message' => '1000字以内で入力してください。']);

        $validator
            ->notBlank('after_migration_work', '選択ください。')
            ->notEmptyString('after_migration_work', '選択ください。');

        $validator
            ->notBlank('privacy', 'プライバシーポリシーに同意してください。')
            ->notEmptyString('privacy', 'プライバシーポリシーに同意してください。')
            ->add('privacy', 'valid', ['rule' => [$this, 'checkIsPrivacy'], 'provider' => 'App', 'message' => 'プライバシーポリシーに同意してください。']);

        return $validator;
    }
}
