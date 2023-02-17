<div class="modal fade" id="popupSelectBlock" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">パーツを選択してください</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body table_area">

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-gray-dark">
                                <h2 class="card-title">ブロック追加</h2>
                                <?= $this->Form->input('content_count', ['type' => 'hidden', 'value' => h($content_count), 'id' => 'idContentCount']); ?>
                            </div>

                            <div class="card-body row select_block_area">
                                <?php foreach ($block_type_list as $k => $v) : ?>
                                    <div class="col-6 col-md-3 mb-2">
                                        <button type="button" class="block_button btn btn-primary" data-info_id="<?= $entity->id ?>" data-slug="<?= h($page_config->slug) ?>" onClick="addBlock(<?= $v->item_type ?>, this); return false;" data-dismiss="modal"><?= \App\Model\Entity\Info::BLOCK_TYPE_LIST[$v->item_type]; ?></button>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if (@$is_waku) : ?>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header bg-gray-dark">
                                    <h2 class="card-title">枠ブロック追加</h2>
                                </div>

                                <div class="card-body row select_block_area">
                                    <?php foreach ($block_type_waku_list as $k => $v) : ?>
                                        <div class="col-6 col-md-3 mb-2">
                                            <button type="button" class="block_button btn btn-primary" data-info_id="<?= $entity->id ?>" data-slug="<?= h($page_config->slug) ?>" onClick="addBlock(<?= h($k); ?>, this); return false;" data-dismiss="modal"><?= h($v); ?></button>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endif ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
            </div>
        </div>
    </div>
</div>