<table class="table table-sm table-hover table-bordered dataTable dtr-inline">
    <colgroup>
        <col style="width: 100px;">
        <col style="width: 75px;">
        <col style="width: 135px">
        <col>
        <col style="width: 75px;">
        <col style="width: 150px">
    </colgroup>

    <thead class="bg-gray">
        <tr>
            <th class="t_align_c">掲載</th>
            <th class="t_align_c">記事ID</th>
            <th class="t_align_c">掲載日時</th>
            <th><?= ($this->Common->isCategoryEnabled($page_config) ? 'カテゴリ / ' : '') ?>タイトル</th>
            <th class="t_align_c">確認</th>
            <th class="t_align_c">順序の変更</th>

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
            if ($data->date && $data->date->format('Y-m-d') > $now->format('Y-m-d')) {
                // 掲載待ち
                $status_class = 'unvisible';
                $status_text = '掲載待ち';
            }
        }

        $preview_url = "/column/{$data->id}?preview=on";
    ?>
        <a name="m_<?= $id ?>"></a>
        <tr class="<?= $status_class; ?>" id="content-<?= $data->id ?>">
            <td>
                <?= $this->element('status_button', ['status' => $status, 'id' => $data->id, 'class' => 'scroll_pos', 'enable_text' => $status_text, 'disable_text' => $status_text]); ?>
            </td>

            <td class="t_align_c">
                <?= $data->id; ?>
            </td>

            <td class="t_align_c">
                <?= $data->date ? $data->date->format('Y/m/d') : "&nbsp;" ?>
            </td>

            <td>
                <?php if ($this->Common->isCategoryEnabled($page_config)) : ?>
                    <?= $this->Html->view((!empty($data->category->name) ? $data->category->name : '未設定'), ['before' => '【', 'after' => '】<br>']); ?>
                <?php endif; ?>
                <?= $this->Html->link(h($data->title), ['action' => 'edit', $data->id, '?' => $query], ['escape' => false, 'class' => 'btn btn-light w-100 text-left']) ?>
            </td>

            <td>
                <div class="prev t_align_c"><a href="<?= $preview_url ?>" target="_blank">プレビュー</a></div>
            </td>

            <td>
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

        </tr>
    <?php endforeach; ?>
</table>