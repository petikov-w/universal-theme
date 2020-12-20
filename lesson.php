<?php
/*
Template Name: Страница уроки
Template Post Type: page
*/
$icon_right_arrow = get_template_directory_uri() . '/assets/images/sprite.svg#arrow';
$icon_left_arrow  = get_template_directory_uri() . '/assets/images/sprite.svg#left-arrow';
get_header();
?>

<div class="category-wrapper">
    <div class="container m-top">
        <div class="posts-list">
		    <?php
                $args_career = array(
                'post_type' => 'lesson',
                );
                cycle_wp_query($args_career, 'list-posts-in-x');
            ?>
        </div>
        <div class="category-pagination">
		    <?php the_posts_pagination([
			    'prev_text'    => '<svg width="15" height="7" class="icon pagination-icon">
                                        <use xlink:href="'. $icon_left_arrow .'"></use>
                                    </svg>&nbsp' . __( 'Назад', 'universal' ),
			    'next_text'    => __( 'Вперед', 'universal' ) . '&nbsp<svg width="15" height="7" 
                                        class="icon pagination-icon">
                                        <use xlink:href="'. $icon_right_arrow .'"></use>
                                    </svg>',
		    ]); ?>
        </div>
    </div>
</div>

<?php
get_footer();



