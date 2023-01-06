<?php
/**
 * ページネーションのレイアウトを変更したい場合はここを編集
 */

// return [
//     'prevActive' => '<li class="prev"><a href="{{url}}" class="arrow-btn">{{text}}</a></li>',
//     'prevDisabled' => '',
//     'nextActive' => '<li class="next"><a href="{{url}}" class="arrow-btn">{{text}}</a></li>',
//     'nextDisabled' => '',
//     'counterRange' => '{{start}} - {{end}} of {{count}}',
//     'counterPages' => '{{page}} of {{pages}}',
//     'first' => '<li class="first"><a href="{{url}}">{{text}}</a></li>',
//     'last' => '<li class="last"><a href="{{url}}">{{text}}</a></li>',
//     'number' => '<li><a href="{{url}}">{{text}}</a></li>',
//     'current' => '<li class="active"><a href="#">{{text}}</li>',
//     'ellipsis' => '',
//     'sort' => '<a href="{{url}}">{{text}}</a>',
//     'sortAsc' => '<a class="asc" href="{{url}}">{{text}}</a>',
//     'sortDesc' => '<a class="desc" href="{{url}}">{{text}}</a>',
//     'sortAscLocked' => '<a class="asc locked" href="{{url}}">{{text}}</a>',
//     'sortDescLocked' => '<a class="desc locked" href="{{url}}">{{text}}</a>',
// ]

return [
    'nextActive' => '<li class="paging-next"><a href="{{url}}"><span>NEXT</span></a></li>',
    'prevActive' => '<li class="paging-prev"><a href="{{url}}"><span>BACK</span></a></li>',
    'nextDisabled' => '<li class="paging-next disable"><a><span>NEXT</span></a></li>',
    'prevDisabled' => '<li class="paging-prev disable"><a><span>BACK</span></a></li>',
    'ellipsis' => '<li class="dot"><a href="#">...</a></li>',
    'number' => '<li class="paging-item"><a href="{{url}}">{{text}}</a></li>',
    'current' => '<li class="paging-item active"><a>{{text}}</a></li>'
];
