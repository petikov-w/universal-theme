<li class="article-item">
    <a class="article-permalink" href="<?php echo get_the_permalink(); ?>">
        <h4 class="article-title"><?php echo mb_strimwidth(get_the_title(),0,55,'...'); ?></h4>
        <img width="65" height="65" src="<?php echo get_the_post_thumbnail_url(null,'thumbnail')?>" alt="">
    </a>
</li>