<div class="file">
    <?php if ($c['file_extension'] == 'xls' || $c['file_extension'] == 'xlsx') : ?>
        <a style="font-style: oblique;color: #c7aa1d;" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-medical"></i></a>
    <?php elseif ($c['file_extension'] == 'doc' || $c['file_extension'] == 'docx') : ?>
        <a style="font-style: oblique;color: #c7aa1d;" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-word"></i></a>
    <?php else : ?>
        <a style="font-style: oblique;color: #c7aa1d;" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-pdf"></i></a>
    <?php endif; ?>
</div>