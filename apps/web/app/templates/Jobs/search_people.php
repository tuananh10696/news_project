<?php

use Cake\Utility\Hash;
?>
<?php $this->start('css') ?>
<style>
    .parrent-job-options {
        border-bottom: var(--bs-border-width) var(--bs-border-style) var(--bs-border-color) !important;
    }

    .job_h3 {
        font-size: 20px;
        color: rgba(var(--color-black-rgb), 0.9)
    }

    .job-options {
        margin-top: 10px;
        color: #282d2bad;
        margin-bottom: -10px;
    }

    .child-job-options {
        margin-left: 20px;
    }

    .img-job-options {
        margin-bottom: 10px;
    }

    .job-options-heart {
        margin-left: 50px;
    }
</style>
<?php $this->end('css') ?>

<main id="main">
    <!-- ======= Search Results ======= -->
    <section id="search-result" class="search-result">
        <div class="container">
            <div class="row">
                <div class="col-md-9">

                    <div class="store-sort">
                        <?php $category = Hash::combine($category, '{n}.id', '{n}.name');
                        $peple_job_type = ['Tìm người', 'Tìm việc']
                        ?>
                        <?= $this->Form->create(null, ['type' => 'GET', 'name' => 'search_job_form']) ?>
                        <label>
                            <?= $this->Form->input('peple_job_type', ['value' => $search_type_job, 'type' => 'select', 'options' => $peple_job_type, 'class' => 'input-select']) ?>
                        </label>
                        <label>
                            <?= $this->Form->input('job_type', ['empty' => 'Công việc', 'type' => 'select', 'options' => $category, 'class' => 'input-select']) ?>
                        </label>
                        <label>
                            <?= $this->Form->input('prefectures', ['empty' => 'Địa điểm', 'type' => 'select', 'options' => $prefecture_list, 'class' => 'input-select']) ?>
                        </label>
                        <?php $this->Form->end() ?>
                    </div>

                    <?php foreach ($infos as $news_index_data) : ?>
                        <div class="d-md-flex post-entry-2 small-img parrent-job-options">
                            <a href="/jobs/<?= $news_index_data->id ?>">
                                <div>
                                    <div class="post-meta"><span class="date"><?= $news_index_data->category->name ?></span> <span class="mx-1">&bullet;</span> <span><?= $news_index_data->start_datetime->format('Y.m.d') ?></span></div>
                                    <h3 class="job_h3"><a href="/jobs/<?= $news_index_data->id ?>"><?= h($news_index_data->title) ?></a></h3>
                                    <div class="d-flex job-options">
                                        <p><i class="bi bi-briefcase-fill"></i> 正社員</p>
                                        <p class="child-job-options"><i class="bi bi-geo-alt-fill"></i> Tochigi</p>
                                        <p class="child-job-options"><i class="bi bi-currency-yen"></i> 220,000</p>
                                        <p class="job-options-heart"><i class="bi bi-heart"></i></p>

                                    </div>
                                    <div class="d-flex align-items-center author">
                                        <div class="photo"><img src="assets/img/anh.jpeg" alt="" class="img-fluid thum_img"></div>
                                        <div class="name">
                                            <h3 class="m-0 p-0">Wade Warren</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    <?php endforeach; ?>

                    <!-- Paging -->
                    <div class="text-start py-4">
                        <div class="custom-pagination">
                            <?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>
                                <?php if ($this->Paginator->hasPrev()) : ?><?= $this->Paginator->prev('') ?><?php endif; ?>
                                <?= $this->Paginator->numbers(); ?>
                                <?php if ($this->Paginator->hasNext()) : ?><?= $this->Paginator->next('') ?><?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div><!-- End Paging -->

                </div>

                <div class="col-md-3">
                    <!-- ======= Sidebar ======= -->
                    <!-- Trending Section -->

                    <div class="trending">
                        <h3>Hot Jobs</h3>
                        <ul class="trending-post">
                            <li>
                                <a href="single-post.html">
                                    <span class="number">1</span>
                                    <h3>The Best Homemade Masks for Face (keep the Pimples Away)</h3>
                                    <span class="author">Jane Cooper</span>
                                </a>
                            </li>
                            <li>
                                <a href="single-post.html">
                                    <span class="number">2</span>
                                    <h3>17 Pictures of Medium Length Hair in Layers That Will Inspire Your
                                        New Haircut</h3>
                                    <span class="author">Wade Warren</span>
                                </a>
                            </li>
                            <li>
                                <a href="single-post.html">
                                    <span class="number">3</span>
                                    <h3>13 Amazing Poems from Shel Silverstein with Valuable Life Lessons
                                    </h3>
                                    <span class="author">Esther Howard</span>
                                </a>
                            </li>
                            <li>
                                <a href="single-post.html">
                                    <span class="number">4</span>
                                    <h3>9 Half-up/half-down Hairstyles for Long and Medium Hair</h3>
                                    <span class="author">Cameron Williamson</span>
                                </a>
                            </li>
                            <li>
                                <a href="single-post.html">
                                    <span class="number">5</span>
                                    <h3>Life Insurance And Pregnancy: A Working Mom’s Guide</h3>
                                    <span class="author">Jenny Wilson</span>
                                </a>
                            </li>
                        </ul>
                    </div>


                    <!-- End Categories -->

                </div>

            </div>
        </div>
    </section> <!-- End Search Result -->

</main>
<!-- End #main -->

<?php $this->start('script') ?>
<script>
    $(document).ready(function() {
        $('select').on('change', function() {
            document.forms['search_job_form'].submit();
        });
    });
</script>
<?php $this->end('script') ?>