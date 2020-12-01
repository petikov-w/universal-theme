<?php
$icon_right_arrow = get_template_directory_uri().'/assets/images/sprite.svg#arrow';
$icon_left_arrow = get_template_directory_uri().'/assets/images/sprite.svg#left-arrow';
get_header();
?>
<!--   --><?php //echo 'это страница категорий'?>
	<div class="category-wrapper">
        <div class="container mxz">
	        <?php if ( function_exists( 'the_breadcrumbs' ) ) the_breadcrumbs(); ?>
            <div class="category-title">
		        <?php single_cat_title(); ?>
            </div>
            <div class="posts-list">
		        <?php cycle_wp_posts('list-posts-in-category'); ?>
            </div>
            <div class="category-pagination">
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
    </div>

<?php
get_footer();
