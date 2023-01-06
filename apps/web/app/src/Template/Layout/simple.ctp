<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="format-detection" content="telephone=no">
    <title><?= $__title__ ?></title>
    <meta name="Description" content="<?= $__description__ ?>">
    <meta property="og:type" content="website">
    <meta property="og:description" content="<?= $__description__ ?>">
    <meta property="og:title" content="<?= $__title__ ?>">
    <meta property="og:url" content="https://www.atm-net.co.jp/">
    <meta property="og:image" content="https://www.atm-net.co.jp/">
    <meta property="og:locale" content="ja_JP">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:description" content="<?= $__description__ ?>">
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300;400;500;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&amp;display=swap">
    <link rel="stylesheet" href="/assets/css/common.css">
    <?= $this->fetch('css') ?>

    <script>
        var bodyWidth = (document.body && document.body.clientWidth) || 0;
        document.documentElement.style.setProperty('--vw', (bodyWidth / 100) + 'px');
        document.documentElement.style.setProperty('--vh', (window.innerHeight / 100) + 'px');
    </script>
</head>

<body>
    <div class="root" id="root">
        <header class="header" id="header">
            <?php include_once WWW_ROOT . 'assets/include/header.html' ?>
        </header>


        <?= $this->fetch('content'); ?>

        <footer class="footer" id="footer">
            <?= $this->fetch('contact'); ?>
            <?php include_once WWW_ROOT . 'assets/include/footer.html' ?>
        </footer>

    </div>
    <script src="/assets/js/vendor.js" defer></script>
    <script src="/assets/js/runtime.js" defer></script>
    <script src="/assets/js/bundle.js" defer></script>
    <?= $this->fetch('script') ?>
</body>

</html>