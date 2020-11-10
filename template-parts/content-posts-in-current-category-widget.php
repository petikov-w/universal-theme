
   <a href="<?php echo get_the_permalink(); ?>" class="post_in_current_category-link">
        <img src="<?php
        if( has_post_thumbnail() ) {
	        echo get_the_post_thumbnail_url();
        }
        else {
	        echo get_template_directory_uri().'/assets/images/img-default-sm.png';
        }
        ?> ?>" alt="" class="img-post-in-cat">
        <span class="post_in_current_category-info">
            <span class="post_in_current_category-title"><?php echo mb_strimwidth(get_the_title(),0,62,'...'); ?></span>
            <svg width="15" height="10" class="icon comment-silver-icon">
                     <use xlink:href="
                     <?php echo get_template_directory_uri().'/assets/images/sprite.svg#eye'?>">
                     </use>
                </svg>
                <span class="comments-counter"><?php comments_number('0','1','%'); ?></span>
                <svg width="14" height="14" class="icon comment-silver-icon">
                     <use xlink:href="
                     <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#comment'?>">
                     </use>
                </svg>
                <span class="comments-counter"><?php comments_number('0','1','%'); ?></span>

        </span>
   </a>

