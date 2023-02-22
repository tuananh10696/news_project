<section class="mb-5 bg-light py-5">
    <div class="container" data-aos="fade-up">
        <div class="row justify-content-between align-items-lg-center">
            <div class="col-lg-5 mb-4 mb-lg-0">
                <h2 class="display-4 mb-4"><?= h($c['title']) ?></h2>
                <p><?= nl2br(h($c['content'])) ?></p>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-6">
                        <img src="<?= h($c['attaches']['image'][0]) ?>" alt="" class="img-fluid mb-4">
                    </div>
                    <div class="col-6 mt-4">
                        <img src="<?= h($c['attaches']['image2'][0]) ?>" alt="" class="img-fluid mb-4">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>