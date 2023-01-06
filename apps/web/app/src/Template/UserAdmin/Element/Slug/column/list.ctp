<?php

use App\Model\Entity\PageConfigItem;
?>
<table class="table table-sm table-hover table-bordered dataTable dtr-inline">
    <colgroup>
        <col style="width: 100px;">
        <col style="width: 75px;">
        <col style="width: 205px;">
        <col style="width: 135px">
        <col>

        <?php if ($this->Common->isViewPreviewBtn($page_config)) : ?>
            <col style="width: 75px;">
        <?php endif; ?>

        <?php if ($this->Common->isViewSort($page_config, $sch_category_id)) : ?>
            <col style="width: 150px">
        <?php endif; ?>
    </colgroup>

    <thead class="bg-gray">
        <tr>
            <th class="t_align_c">掲載</th>
            <th class="t_align_c">記事ID</th>
            <th class="t_align_c">よく読まれているコラム</th>
            <th class="t_align_c">掲載日時</th>
            <th>
                <?php if ($this->Common->isCategoryEnabled($page_config)) {
                    echo 'カテゴリ/';
                } ?>
                <?php if ($this->Common->enabledInfoItem($page_config->id, PageConfigItem::TYPE_MAIN, 'title')) : ?>
                    <?= $this->Common->infoItemTitle($page_config->id, PageConfigItem::TYPE_MAIN, 'title', 'title', 'タイトル'); ?>
                <?php endif; ?>
            </th>

            <?php if ($this->Common->isViewPreviewBtn($page_config)) : ?>
                <th class="t_align_c">確認</th>
            <?php endif; ?>

            <?php if ($this->Common->isViewSort($page_config, $sch_category_id)) : ?>
                <th class="t_align_c">順序の変更</th>
            <?php endif; ?>

        </tr>
    </thead>

    <?php
    foreach ($data_query->toArray() as $key => $data) :
        $data->appendInit();
        $no = sprintf("%02d", $data->id);
        $id = $data->id;
        $scripturl = '';

        $status = $data['status'] === 'publish';
        $status_text = $status ? '掲載中' : '下書き';
        $status_class = $status ? 'visible' : 'unvisible';
        $status_btn_class = $status ? 'visi' : 'unvisi';

        if ($status) {
            $now = new \DateTime();
            if ($data->start_datetime->format('Y-m-d') > $now->format('Y-m-d')) {
                // 掲載待ち
                $status_class = 'unvisible';
                $status_text = '掲載待ち';
            }
        }
        $preview_url = "/" . $page_config->slug . "/{$data->id}?preview=on";
    ?>
        <a name="m_<?= $id ?>"></a>
        <tr class="<?= $status_class; ?>" id="content-<?= $data->id ?>">
            <td class="t_align_c">
                <?= $this->element('status_button', ['status' => $status, 'id' => $data->id, 'class' => 'scroll_pos', 'enable_text' => $status_text, 'disable_text' => $status_text]); ?>
            </td>

            <td class="t_align_c">
                <?= $data->id; ?>
            </td>

            <td class="t_align_c">
                <?= $data->popular == 1 ? '○' : ''; ?>
            </td>

            <td class="t_align_c">
                <?= $data->start_datetime ? $data->start_datetime->format('Y/m/d') : "&nbsp;" ?>
            </td>

            <td>
                <?php $is_map_txt = $data->index_type == 1 ? '<span class="badge badge-danger">おすすめ</span>' : ''; ?>
                <?php if ($this->Common->isCategoryEnabled($page_config)) : ?>
                    <?php if ($page_config->is_category_multiple == 1) : ?>
                        <?= $this->Html->view($this->Common->getInfoCategories($data->id, 'names'), ['before' => '【', 'after' => '】' . $is_map_txt . '<br>']); ?>
                    <?php else : ?>
                        <?= $this->Html->view((!empty($data->category->name) ? $data->category->name : '未設定'), ['before' => '【', 'after' => '】' . $is_map_txt . '<br>']); ?>
                    <?php endif; ?>
                <?php endif; ?>
                <?= $this->Html->link(h($data->title), ['action' => 'edit', $data->id, '?' => $query], ['escape' => false, 'class' => 'btn btn-light w-100 text-left']) ?>

            </td>

            <?php if ($this->Common->isViewPreviewBtn($page_config)) : ?>
                <td class="t_align_c">
                    <?php if (!empty($preview_url)) : ?>
                        <div class="prev"><a href="<?= $preview_url ?>" target="_blank">プレビュー</a></div>
                    <?php endif; ?>
                </td>
            <?php endif; ?>

            <?php if ($this->Common->isViewSort($page_config, $sch_category_id)) : ?>
                <td class="t_align_c">
                    <ul class="ctrlis">
                        <?php if (!$this->Paginator->hasPrev() && $key == 0) : ?>
                            <li class="non">&nbsp;</li>
                            <li class="non">&nbsp;</li>
                        <?php else : ?>
                            <li class="cttop"><?= $this->Html->link('top', array('action' => 'position', $data->id, 'top', '?' => $query), ['class' => 'scroll_pos']) ?></li>
                            <li class="ctup"><?= $this->Html->link('top', array('action' => 'position', $data->id, 'up', '?' => $query), ['class' => 'scroll_pos']) ?></li>
                        <?php endif; ?>

                        <?php if (!$this->Paginator->hasNext() && $key == count($datas) - 1) : ?>
                            <li class="non">&nbsp;</li>
                            <li class="non">&nbsp;</li>
                        <?php else : ?>
                            <li class="ctdown"><?= $this->Html->link('top', array('action' => 'position', $data->id, 'down', '?' => $query), ['class' => 'scroll_pos']) ?></li>
                            <li class="ctend"><?= $this->Html->link('bottom', array('action' => 'position', $data->id, 'bottom', '?' => $query), ['class' => 'scroll_pos']) ?></li>
                        <?php endif; ?>
                    </ul>
                </td>
            <?php endif; ?>

        </tr>

    <?php endforeach; ?>

</table>