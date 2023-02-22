<div class="container aos-init aos-animate" data-aos="fade-up">
    <div class="row">
        <?php foreach ($c->multi_images as $multi_image) : ?>
            <div class="col-lg-4 text-center mb-5">
                <img src="<?= $multi_image->attaches['image'][0] ?>" alt="" class="img-fluid rounded-circle w-50 mb-4" style="border-radius: 5%!important;width: 100%!important;">
            </div>
        <?php endforeach; ?>
    </div>
</div>