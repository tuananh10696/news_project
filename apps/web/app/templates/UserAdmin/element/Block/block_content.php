<?php if ($contents && isset($contents['contents'])) : ?>
    <?php foreach ($contents['contents'] as $k => $v) : ?>
        <?php if ($v['block_type'] != 13) : ?>
            <?= $this->element(__('Block/block/{0}/{1}', $page_config->slug, strtolower(\App\Model\Entity\Info::$block_number2key_list[$v['block_type']])), ['rownum' => h($v['_block_no']), 'content' => h($v)]); ?>
        <?php endif; ?>
    <?php endforeach; ?>
<?php endif; ?>