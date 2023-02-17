<?php
/**
 * ページネーションのレイアウトを変更したい場合はここを編集
 */


return [
    'nextActive' => '<a class="next" href="{{url}}"><span>→</span></a>',
    'prevActive' => '<a class="prev" href="{{url}}"><span>←</span></a>',
    'ellipsis' => '<a href="#">...</a>',
    'number' => '<a href="{{url}}">{{text}}</a>',
    'current' => '<a class="active">{{text}}</a>'
];