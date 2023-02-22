<?php

namespace App\Controller;

use App\Controller\AppController;
use App\Form\ContactForm;
use Cake\Event\EventInterface;
use Cake\Core\Configure;
use Cake\Mailer\Mailer;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class ReserveController extends AppController
{

    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
        $this->setHeadTitle('お問い合わせ');
    }


    public function index($page = 'index')
    {
        $this->viewBuilder()->setClassName('Contact');

        $this->setList();
        $has_session = $this->Session->read('contact');
        $page = in_array($page, ['index', 'confirm', 'complete'], true) ? $page : 'index';

        if (in_array($page, ['confirm', 'complete'], true) && !$has_session) $this->redirect(['action' => 'index']);

        $contact_form = new ContactForm();

        $contact_form = $has_session ? $contact_form->setData($this->Session->read('contact')) : $contact_form;
        if ($has_session && in_array($page, ['index', 'complete'], true)) $this->Session->delete('contact');

        $error = [];
        if ($this->request->is(['post', 'put'])) {
            $data = $this->request->getData();

            $contact_form->validate($data);
            if (empty($contact_form->getErrors())) {
                $page_view = 'index';
                if ($page == 'index') {

                    $this->Session->write(['contact' => $data]);
                    $page_view = 'confirm';
                } elseif ($page == 'confirm') {
                    // mail send
                    $this->_sendmail($data);
                    $page_view = 'complete';
                }
                $this->redirect(['action' => 'index', $page_view]);
            } else $error = $contact_form->getErrors();
        }

        $this->set('error', $error);
        $this->set('form_data', $contact_form->getData());
        $this->set('contact_form', $contact_form);
        $this->render($page);
    }


    public function setList()
    {
        $list = [];
        $list = ['prefecture_list' => $this->getPrefectureList()];
        $list['gender'] = ['男性', '女性'];
        $list['profession'] = ['ご職業1', 'ご職業2', 'ご職業3', 'ご職業4'];
        $list['immigration'] = ['ある', '未定'];
        $list['category'] = ['相談１', '相談2'];
        $list['immigration_time'] = ['1ヶ月', '2ヶ月', '3ヶ月'];
        $list['occupation'] = ['IT 1', 'IT 2', 'IT 3'];

        $list['body_class'] = 'page-reserve';

        if (!empty($list)) $this->set(array_keys($list), $list);

        $this->list = $list;
        return $list;
    }


    private function _sendmail($form)
    {
        $contact_form = new ContactForm();

        // 文字化け対応
        $form['content'] = _preventGarbledCharacters($form['content']);
        $form['region'] = _preventGarbledCharacters($form['region']);
        $form['immigration_people'] = _preventGarbledCharacters($form['immigration_people']);

        $to = ['test+shioya_iju@caters.co.jp'];
        $from = ['test+shioya_iju@caters.co.jp' => '塩谷町移住定住促進サイト'];

        $test_dev_local_server = (strpos($_SERVER["HTTP_HOST"], 'test') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'caters') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'loca') !== false ||
            strpos($_SERVER["HTTP_HOST"], 'localhost') !== false);

        $is_honban = !Configure::read('debug') && !$test_dev_local_server;

        if ($is_honban) {
            // 本番の場合
            $to = ['test+shioya_iju@caters.co.jp'];
            $from = ['test+shioya_iju@caters.co.jp' => '塩谷町移住定住促進サイト'];
        }

        $info_email = new Mailer();
        $info_email->setCharset('ISO-2022-JP-MS')
            ->setEmailFormat('text')
            ->setFrom($from)
            ->setTo($to)
            ->setViewVars(['form' => $form, 'list' => $this->setList()])
            ->setSubject('【塩谷町移住定住促進サイト】お問合せがありました')
            ->viewBuilder()
            ->setTemplate('contact_admin');

        $info_email->send();


        $thank_email = new Mailer();
        $thank_email->setCharset('ISO-2022-JP-MS')
            ->setEmailFormat('text')
            ->setViewVars(['form' => $form, 'list' => $this->setList()])
            ->setFrom($from)
            ->setTo($form['email'])
            ->setSubject('【塩谷町移住定住促進サイト】お問い合わせありがとうございます')
            ->viewBuilder()
            ->setTemplate('contact_user');

        $thank_email->send();
    }
}
