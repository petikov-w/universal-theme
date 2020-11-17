<?php
  $icon_right_arrow = get_template_directory_uri().'/assets/images/sprite.svg#arrow';
  $icon_left_arrow = get_template_directory_uri().'/assets/images/sprite.svg#left-arrow';
  get_header();
?>
<!--========================================================-->
<div class="search-wrapper">
    <div class="container search-list-title">Результаты поиска по запросу:</div>
    <div class="container search-list-wrapper">
        <div class=" articles-grid search-list">
            <ul class="article-list-2">
			    <?php cycle_wp_posts('articlelist-search'); ?>
            </ul>
            <!--  Подключаем сайдбар  -->
		    <?php get_sidebar('main-2'); ?>
        </div>
	        <?php the_posts_pagination([
		        'prev_text'    => __('<svg width="15" height="7" class="icon pagination-icon">
                                        <use xlink:href="'. $icon_left_arrow .'"></use>
                                    </svg>&nbsp Назад'),
		        'next_text'    => __('Вперед &nbsp<svg width="15" height="7" class="icon pagination-icon">
                                        <use xlink:href="'. $icon_right_arrow .'"></use>
                                    </svg>'),
            ]); ?>
    </div>

</div>
<!--=========================================================-->
<?php
get_footer();
