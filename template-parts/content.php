<?php
/**
 * Шаблон для вывода постов
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-theme
 */

?>

<!--	Заголовок поста  -->
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header <?php echo get_post_type() ?>-header" style="background: linear-gradient(0deg, rgba(38, 45, 51, 0.75),
													rgba(38, 45, 51, 0.75)), url(<?php
													if( has_post_thumbnail() ) {
														echo get_the_post_thumbnail_url();
													}
													else {
														echo get_template_directory_uri().
														     '/assets/images/img-default.png';
													}
													?>)"; ">
	<div class="container">
		<?php
		foreach ( get_the_category() as $category ) {
			printf(
				'<a href="%s" class="category-link %s">%s</a>',
				esc_url(get_category_link($category)),
				esc_html($category->slug),
				esc_html($category->name)
			);
		}

		if ( is_singular() ) :
			the_title( '<h1 class="entry-title">', '</h1>' );
		else :
			the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">',
				'</a></h2>' );
		endif;

		?>
	</div>
	</header>
<!--	Заголовок поста (конец) -->


<!--	Содержимое поста  -->
	<div class="entry-content">
		<?php
		the_content(
			sprintf(
				wp_kses(
				/* translators: %s: Name of current post. Only visible to screen readers */
					__( 'Continue reading<span class="screen-reader-text"> "%s"</span>', 'universal-theme' ),
					array(
						'span' => array(
							'class' => array(),
						),
					)
				),
				wp_kses_post( get_the_title() )
			)
		);

		wp_link_pages(
			array(
				'before' => '<div class="page-links">' . esc_html__( 'Страницы:', 'universal-example' ),
				'after'  => '</div>',
			)
		);
		?>
	</div><!-- .entry-content -->
<!--	Содержимое поста (конец) -->

<!--	Подвал поста  -->
	<footer class="entry-footer">
	<?php

		$tags_list = get_the_tag_list( '', esc_html_x( ', ', 'list item separator', 'universal-theme' ) );
		if ( $tags_list ) {
			printf( '<span class="tags-links">' . esc_html__( '%1$s', 'universal-theme' ) . '</span>', $tags_list );
		}
	?>
	</footer><!-- .entry-footer -->
<!--	Подвал поста (конец)  -->
</article>
