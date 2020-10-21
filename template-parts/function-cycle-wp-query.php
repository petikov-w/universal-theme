<?php

function cycle_wp_query ($args_query, $content_block) {
	global $post;
	$query = new WP_Query($args_query);

	if ( $query->have_posts() ) {
		while ( $query->have_posts() ) {
			$query->the_post();
			get_template_part( 'template-parts/content', $content_block );
		}
	} else {
		// Постов не найдено
	}

	wp_reset_postdata(); // Сбрасываем $post
}
?>