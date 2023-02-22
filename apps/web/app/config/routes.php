<?php

/**
 * Routes configuration.
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different URLs to chosen controllers and their actions (functions).
 *
 * It's loaded within the context of `Application::routes()` method which
 * receives a `RouteBuilder` instance `$routes` as method argument.
 *
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

use Cake\Routing\Route\DashedRoute;
use Cake\Routing\RouteBuilder;

return static function (RouteBuilder $routes) {

    $routes->setRouteClass(DashedRoute::class);

    $routes->scope('/', function (RouteBuilder $builder) {

        $builder->connect('/reserve/:page', ['controller' => 'Reserve', 'action' => 'index'])->setPass(['page']);
        $builder->connect('/', ['controller' => 'Homes', 'action' => 'index']);

        $builder->connect('/:controller/:id', ['action' => 'detail'])
            ->setPatterns(['id' => '[1-9]?[0-9]+'])
            ->setPass(['id']);

        $builder->fallbacks();
    });

    $routes->prefix('admin', function (RouteBuilder $builder) {
        $builder->connect('/', ['controller' => 'Admin', 'action' => 'index', 'prefix' => 'admin']);
        $builder->connect('/logout', ['controller' => 'Admin', 'action' => 'logout', 'prefix' => 'admin']);

        $builder->fallbacks();
    });

    $routes->prefix('userAdmin', ['path' => '/user_admin'], function (RouteBuilder $builder) {
        $builder->connect('/', ['controller' => 'Home', 'action' => 'index', 'prefix' => 'userAdmin'], ['_name' => 'userTop']);
        $builder->connect('/logout', ['controller' => 'Home', 'action' => 'logout', 'prefix' => 'userAdmin'], ['_name' => 'logout']);
        $builder->connect('/menu-reload', ['controller' => 'Home', 'action' => 'menu-reload', 'prefix' => 'userAdmin'], ['_name' => 'userMenuReload']);

        $builder->fallbacks(DashedRoute::class);
    });
};
