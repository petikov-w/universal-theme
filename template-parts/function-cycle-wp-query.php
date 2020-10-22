<?php

function cycle_wp_query ($args_query, $content_block) {
	global $post; // Объявляем глобальную переменнную $post
	$query = new WP_Query($args_query);
	// проверяем есть ли посты в сформированном массиве $query
	if ( $query->have_posts() ) {
		// если есть запускаем цикл вывода постов
		while ( $query->have_posts() ) {
			$query->the_post();// устанавливаем данные
			get_template_part( 'template-parts/content', $content_block );
		}
	} else {
	?>
		<p>Постов не найдено</p>
	<?php
	}
	wp_reset_postdata(); // Сбрасываем $post
}


function cycle_wp_query_switch ($args_query, $content_block) {
	global $post; // Объявляем глобальную переменнную $post
	$query = new WP_Query($args_query);
	// проверяем есть ли посты в сформированном массиве $query
	$_SESSION['filter'] = $args_query['tag'];
	if ( $query->have_posts() ) {
		$cnt=0;
		// если есть запускаем цикл вывода постов
		while ( $query->have_posts() ) {
			$query->the_post();// устанавливаем данные
			$cnt++;
			$_SESSION['count'] = $cnt;
			get_template_part( 'template-parts/content', $content_block );
		}
	} else {
		?>
        <p>Постов не найдено</p>
		<?php
	}
	wp_reset_postdata(); // Сбрасываем $post
}

?>