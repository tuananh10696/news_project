<div class="file">
    <?php if ($c['file_extension'] == 'xls' || $c['file_extension'] == 'xlsx') : ?>
        <div style="padding-bottom:20px">
            <a class="fileClass" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-medical"></i></a><br>
        </div>
    <?php elseif ($c['file_extension'] == 'doc' || $c['file_extension'] == 'docx') : ?>
        <div style="padding-bottom:20px">
            <a class="fileClass" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-word"></i></a>
        </div>
    <?php else : ?>
        <div style="padding-bottom:20px">
            <a class="fileClass" href="<?= $c['attaches']['file'][0]; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="bi bi-file-earmark-pdf"></i></a>
        </div>
    <?php endif; ?>
</div>