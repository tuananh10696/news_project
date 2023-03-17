<?php

/**
 * ページネーションのレイアウトを変更したい場合はここを編集
 */
return [
    'nextActive' => '<a class="next" href="{{url}}">{{text}}</a>',
    'nextDisabled' => '<a href="#"></a>',
    'prevActive' => '<a class="prev" href="{{url}}">{{text}}</a>',
    'prevDisabled' => '<a href="#"></a>',
    'current' => '<a class="active">{{text}}</a>',

];
// <div class="text-start py-4">
//   <div class="custom-pagination">
//     <a href="#" class="prev">Prevous</a>
//     <a href="#" class="active">1</a>
//     <a href="#">2</a>
//     <a href="#">3</a>
//     <a href="#">4</a>
//     <a href="#">5</a>
//     <a href="#" class="next">Next</a>
//   </div>
// </div><!-- End Paging -->
