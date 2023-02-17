<div id="error_message_waku">
<?php if (!empty($error_messages)): ?>
    <div class="error">
            <?= $error_messages; ?>
            <div><?= $this->Flash->render(); ?></div>
    </div>
<?php endif; ?>
</div>