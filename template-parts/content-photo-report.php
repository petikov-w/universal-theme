<?php
    $author_id=get_the_author_meta('ID');
?>

<div class="photo-report">
<!--  ==================== Подключение слайдера ======================= -->
    <div class="swiper-container photo-report-slider">
        <div class="swiper-wrapper">
            <!-- Slides -->
	        <?php $images = get_attached_media('image');
	        $images_count=count($images);
	        foreach ( $images as $image) {
	            echo '<div class="swiper-slide"><img src="';
		        print_r($image->guid);
	            echo '"></div>';
	        }
	        ?>
        </div>
        <div class="swiper-pagination"></div>
    </div>
<!--  ==================== Подключение слайдера (конец) =============== -->
            <span class="category-box"><?php echo get_the_category()[0]->name ?></span>
            <a href="<?php echo get_author_posts_url($author_id)?>" class="author-photo-report">
                <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar">
                <div class="author-info">
                    <span class="author-name-photo-report"><?php the_author() ?></span>
                    <span class="author-rank-photo-report">Должность</span>
                </div>
            </a>
            <h3 class="photo-report-title"><?php the_title() ?></h3>
            <a href="<?php get_the_permalink() ?>" class="button photo-report-button">
                <svg width="19" height="15" class="icon photo-report-icon">
                    <use xlink:href="<?php echo get_template_directory_uri().'/assets/images/sprite.svg#photo'?>"></use>
                </svg>Смотреть фото
            <span class="button-photo-counter"><?php echo $images_count; ?></span></a>
</div>


