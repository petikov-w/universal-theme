
<div class="lesson-card">
    <a href="<?php echo get_the_permalink() ?>">
    <img src="<?php echo get_the_post_thumbnail_url() ?>" alt="" class="card-thumb">
    <div class="post-card-info">
        <div class="title-lesson"><?php echo mb_strimwidth(get_the_title(),0,30,'...'); ?></div>

        <!-- ======================================================= -->

            <div class="lesson-info">
                    <div class="date-comm-like-cat">
                        <span class="date-post-cat"><?php echo get_the_date('j M') ?></span>
                        <div class="comms">
                            <svg width="14" height="14" class="icon comment-silver-icon">
                                <use xlink:href="
                                             <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#comment'?>">
                                </use>
                            </svg>
                            <span class="comments-count"><?php comments_number('0','1','%'); ?></span>
                        </div>
                        <div class="likes">
                            <svg width="13" height="12" class="icon comment-silver-icon">
                                <use xlink:href="
                                             <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#like'?>">
                                </use>
                            </svg>
                            <span class="comments-count"><?php comments_number('0','1','%'); ?></span>
                        </div>
                    </div>
            </div>
        <!-- ======================================================= -->
    </div>
    </a>
</div>
