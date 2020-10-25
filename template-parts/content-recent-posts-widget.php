
   <a href="<?php echo get_the_permalink(); ?>" class="reсent-post-link">
        <img src="<?php echo get_the_post_thumbnail_url(null,'thumbnail') ?>" alt="">
        <span class="recent-post-info">
            <span class="recent-post-title"><?php echo mb_strimwidth(get_the_title(),0,33,'...'); ?></span>
            <span class="recent-post-time">
                 <?php $time_diff = human_time_diff( get_post_time('U'), current_time('timestamp') ); echo "$time_diff назад"; ?>
            </span>
        </span>
   </a>

