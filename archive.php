<?php

$icon_right_arrow = get_template_directory_uri() . '/assets/images/sprite.svg#arrow';
$icon_left_arrow  = get_template_directory_uri() . '/assets/images/sprite.svg#left-arrow';
	get_header();
?>

<div class="category-wrapper">
	<div class="container">
		<?php if ( function_exists( 'the_breadcrumbs' ) ) the_breadcrumbs(); ?>
		<div class="category-title">
			<?php
			if(is_category()) {
				single_cat_title();
			}
			if(is_tax()) {
				single_term_title();
			}
			if (is_author()){
				echo get_the_author();
			}
            if (is_tag()){
			}
			?>
		</div>
		<div class="posts-list">
			<?php cycle_wp_posts('list-posts-in-x'); ?>
		</div>
		<div class="category-pagination">
			<?php the_posts_pagination([
				'prev_text'    => '<svg width="15" height="7" class="icon pagination-icon">
                                        <use xlink:href="'. $icon_left_arrow .'"></use>
                                    </svg>&nbsp' . __( 'Назад', 'universal' ),
				'next_text'    => __( 'Вперед', 'universal' ) . '&nbsp<svg width="15" height="7" class="icon pagination-icon">
                                        <use xlink:href="'. $icon_right_arrow .'"></use>
                                    </svg>',
			]); ?>
		</div>
	</div>
</div>

<?php
	get_footer();

