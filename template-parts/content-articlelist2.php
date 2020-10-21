<li class="article-item-area">
    <img width="335" height="195" src="<?php echo get_the_post_thumbnail_url(null,'post-img')?>" alt="">

    <div class="aricle-item-info">
        <a class="article-permalink" href="<?php echo get_the_permalink(); ?>">
            <h4 class="article-title-2"><?php echo mb_strimwidth(get_the_title(),0,55,'...'); ?></h4>
        </a>

        <div class="exp-txt3">
            <p><?php echo mb_strimwidth(get_the_excerpt(),0,200,'...'); ?></p>
        </div>
        <div class="author-bio2">
            <a href="<?php echo get_the_permalink() ?>">
                <div class="date-comm-like">
                    <span class="date-post2"><?php echo get_the_date('j F') ?></span>
                    <img class="comment" src="<?php echo get_template_directory_uri().'/assets/images/comment.svg' ?>" alt="">
                    <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                    <img class="like" src="<?php echo get_template_directory_uri().'/assets/images/heart.svg' ?>" alt="">
                    <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                </div>
            </a>
        </div>
    </div>


</li>