<div class="post-card">
	<img src="<?php echo get_the_post_thumbnail_url() ?>" alt="" class="card-thumb">
    <div class="post-card-info">
        <div class="title-pst"><?php echo mb_strimwidth(get_the_title(),0,20,'...'); ?></div>
        <p><?php echo mb_strimwidth(get_the_excerpt(),0,90,'...'); ?></p>
        <!-- ======================================================= -->
	    <?php $author_id=get_the_author_meta('ID') ?>
        <div class="author-cat">
                <a href="<?php echo get_author_posts_url($author_id)?>" >
                    <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar-md">
                </a>
                <div class="author-bio-cat">
                    <a href="<?php echo get_author_posts_url($author_id)?>" >
                        <div class="cat-author-name"><?php the_author() ?></div>
                    </a>
                    <a href="<?php echo get_the_permalink() ?>">
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
                    </a>
                </div>
        </div>
        <!-- ======================================================= -->
    </div>
</div>


