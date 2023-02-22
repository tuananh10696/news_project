<?php

/**
 * ページネーションのレイアウトを変更したい場合はここを編集
 */
return [
    'nextActive' => '<li class="next"><a href="{{url}}"><i class="icon-arrow glyphs-arrow-right"></i></a></li>',
    'nextDisabled' => '<li class="next disable"><a href="#"><i class="icon-arrow glyphs-arrow-right"></i></a></li>',
    'prevActive' => '<li class="prev"><a href="{{url}}"><i class="icon-arrow glyphs-arrow-left"></i></a>',
    'prevDisabled' => '<li class="prev disable"><a href="#"><i class="icon-arrow glyphs-arrow-left"></i></a></li>',
    'current' => '<li class="active"><a>{{text}}</a></li>',
    'ellipsis' => '<li class="dot"><a>...</a></li>'
];
