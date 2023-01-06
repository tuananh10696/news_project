<?php

use App\Model\Entity\PageConfigItem;
?>
<table class="table table-sm table-hover table-bordered dataTable dtr-inline">
    <colgroup>
        <col style="width: 100px;">
        <col style="width: 75px;">
        <col style="width: 250px">
        <col>
    </colgroup>

    <thead class="bg-gray">
        <tr>
            <th class="t_align_c">掲載</th>
            <th class="t_align_c">記事ID</th>
            <th>担当</th>
            <th>
                会社名 /
                <?php if ($this->Common->enabledInfoItem($page_config->id, PageConfigItem::TYPE_MAIN, 'title')) : ?>
                    <?= $this->Common->infoItemTitle($page_config->id, PageConfigItem::TYPE_MAIN, 'title', 'title', 'タイトル'); ?>
                <?php endif; ?>
            </th>
        </tr>
    </thead>

    <?php
    foreach ($data_query->toArray() as $key => $data) :
        $data->appendInit();
        $no = sprintf("%02d", $data->id);
        $id = $data->id;

        $status = $data['status'] === 'publish';
        $status_text = $status ? '掲載中' : '下書き';
        $status_class = $status ? 'visible' : 'unvisible';
        $status_btn_class = $status ? 'visi' : 'unvisi';
    ?>
        <a name="m_<?= $id ?>"></a>
        <tr class="<?= $status_class; ?>" id="content-<?= $data->id ?>">
            <td>
                <?= $this->element('status_button', ['status' => $status, 'id' => $data->id, 'class' => 'scroll_pos', 'enable_text' => $status_text, 'disable_text' => $status_text]); ?>
            </td>
            <td class="t_align_c"><?= $data->id; ?></td>
            <td><?= h($data->info_append_items[0]->value_text) ?></td>
            <td>
                <?= __('【{0}】<br>', h($data->info_append_items[1]->value_text)); ?>
                <?= $this->Html->link(h($data->title), ['action' => 'edit', $data->id, '?' => $query], ['escape' => false, 'class' => 'btn btn-light w-100 text-left']) ?>
            </td>
        </tr>
    <?php endforeach; ?>
</table>