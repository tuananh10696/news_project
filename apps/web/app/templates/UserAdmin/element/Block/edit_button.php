<div class="btn_area center">
    <button type="submit" class="btn btn-danger btn_post submitButton"><?= $entity->isNew() ? '登録する' : '変更する' ?></button>

    <?php if (!$entity->isNew() && $this->Common->isUserRole('admin')) : ?>
        <?php $url = $this->Url->build(['action' => 'delete', $entity->id, 'content', null, '?' => $query]) ?>
        <a href="javascript:kakunin('データを完全に削除します。よろしいですか？','<?= $url ?>')" class="btn btn_post btn_delete">
            <i class="far fa-trash-alt"></i> 削除する
        </a>
    <?php endif; ?>

</div>