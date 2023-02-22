<?php

/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link      https://cakephp.org CakePHP(tm) Project
 * @since     3.0.0
 * @license   https://opensource.org/licenses/mit-license.php MIT License
 */

namespace App\View;

use Cake\View\View;


/**
 * Application View
 *
 * Your application’s default view class
 *
 * @link https://book.cakephp.org/3.0/en/views.html#the-app-view
 */
class ContactView extends AppView
{

    public function initialize(): void
    {
        parent::initialize();

        $form_templates = [
            'inputContainer' => '{{content}}',
            'inputContainerError' => '{{content}}{{error}}',
            'nestingLabel' => '{{input}}<label{{attrs}}>{{text}}</label>',
            'radio' => '<div class="col"><input type="radio" name="{{name}}" value="{{value}}"{{attrs}}>',
            'radioWrapper' => '{{label}}</div>',
            'error' => '<p class="txtErr">{{content}}</p>',
            // 'errorList' => '<ul>{{content}}</ul>',
            'errorItem' => '<p class="txtErr">{{text}}</p>',
        ];

        $this->set(compact('form_templates'));
    }
}
