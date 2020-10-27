<?php
    use ru\universal_theme\variables;
    $author_id=get_the_author_meta('ID');
?>

<div class="photo-report">
    <span class="category-box"><?php echo get_the_category()[0]->name ?></span>
    <img src="<?php get_the_post_thumbnail_url() ?>" alt="" class="post-thumb">
    <a href="<?php echo get_author_posts_url($author_id)?>" class="author-photo-report">
        <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar">
        <div class="author-info">
            <span class="author-name-photo-report"><?php the_author() ?></span>
            <span class="author-rank-photo-report">Должность</span>
        </div>
    </a>
    <h3 class="photo-report-title"><?php the_title() ?></h3>
    <a href="<?php get_the_permalink() ?>" class="button photo-report-button">Смотреть фото
    <span class="button-photo-counter">26</span></a>
</div>