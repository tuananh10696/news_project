function switch_tab(e, is_stock) {
    var _this = $(e),
        cat_id = _this.attr('data-cat_id'),
        is_stock = is_stock || false;

    _this.addClass('active').siblings('li').removeClass('active');

    // if (is_stock) {
    //     $('ul.stock-list__car-list').addClass('display_none');
    //     $(`ul#stock__list_${cat_id}`).removeClass('display_none');

    //     // btn ichiran
    //     $(`.stock-list__link`).addClass('display_none');
    //     $(`#ichiran_btn_${cat_id}`).removeClass('display_none');
    // } else {
    //     $('ul.information__list').addClass('display_none');
    //     $(`ul#information__list_${cat_id}`).removeClass('display_none');
    // }

}