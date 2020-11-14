<?php
    use ru\universal_theme\variables;
    $author_id=get_the_author_meta('ID');
?>

<img src="<?php the_post_thumbnail_url(); ?>" alt="" class="post-thumb">
<a href="<?php echo get_author_posts_url($author_id)?>" class="author">
    <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar-md">
    <div class="author-bio">
        <span class="author-name"><?php the_author() ?></span>
        <span class="author-rank">Должность</span>
    </div>
</a>
<div class="post-text">
	<?php category_colors(variables::$color_category); ?>
    <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
    <a href="<?php echo get_the_permalink(); ?>" class="more">Читать далее<svg width="19" height="15" class="icon arrow-icon">
            <use xlink:href="<?php echo get_template_directory_uri().'/assets/images/sprite.svg#arrow'?>"></use>
        </svg></a>
</div>