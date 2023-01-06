<div class="file">
    <?php if ($c['file_extension'] == 'xls' || $c['file_extension'] == 'xlsx') : ?>
        <div class="file-excel">
            <a href="<?= $c['attaches']['file']['download']; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="c-icon c-icon__excel">Excel</i></a>
        </div>
    <?php elseif ($c['file_extension'] == 'doc' || $c['file_extension'] == 'docx') : ?>
        <div class="file-word">
            <a href="<?= $c['attaches']['file']['download']; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="c-icon c-icon__word">Word</i></a>
        </div>
    <?php else : ?>
        <div class="file-pdf">
            <a href="<?= $c['attaches']['file']['download']; ?>" target="_blank"><?= h($c['file_name']); ?>（<?= human_filesize($c['attaches']['file']['size']) ?>）<i class="c-icon c-icon__pdf">PDF</i></a>
        </div>
    <?php endif; ?>
</div>