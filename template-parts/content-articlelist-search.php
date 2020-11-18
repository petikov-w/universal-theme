<?php
//use ru\universal_theme\variables;
?>

<div class="box">
    <li class="article-item-area">
	    <a href="<?php echo get_the_permalink() ?>">
            <img class="img-33"
                 src="<?php
                         if( has_post_thumbnail() ) {
                             echo get_the_post_thumbnail_url();
                         }
                         else {
                             echo get_template_directory_uri().'/assets/images/img-default.png';
                         }
                      ?>" alt=""></a>

        <div class="aricle-item-info">
            <div class="post-text-info">
                <?php
	            foreach ( get_the_category() as $category ) {
		            printf(
			            '<a href="%s" class="category-link %s">%s</a>',
			            esc_url(get_category_link($category)),
			            esc_html($category->slug),
			            esc_html($category->name)
		            );
	            }
                ?>
                <a class="article-permalink" href="<?php echo get_the_permalink(); ?>">
                    <h4 class="title-article"><?php echo mb_strimwidth(get_the_title(),0,65,'...'); ?></h4>
                </a>
                <p class="exp-txt3"><?php echo mb_strimwidth(get_the_excerpt(),0,150,'...'); ?></p>
            </div>
          <a href="<?php echo get_the_permalink() ?>">
            <div class="post-total-info">
                <span class="date-post3"><?php echo get_the_date('j F') ?></span>
                <svg width="15" height="15" class="icon comment-silver-icon">
                     <use xlink:href="
                     <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#comment'?>">
                     </use>
                </svg>
                <span class="comments-counter3"><?php comments_number('0','1','%'); ?></span>
                <svg width="15" height="15" class="icon comment-silver-icon">
                     <use xlink:href="
                     <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#like'?>">
                     </use>
                </svg>
                <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
            </div>
          </a>
        </div>
</div>

</li>