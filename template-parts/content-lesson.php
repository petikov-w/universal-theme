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
	<header class="entry-header <?php echo get_post_type() ?>-header" style="background: linear-gradient(0deg,
	                              rgba(38, 45, 51, 0.75),	rgba(38, 45, 51, 0.75))">
	<div class="container">
        <div class="video">
            <iframe width="100%" height="450" src="https://www.youtube.com/embed/uhyLPZ5_TZw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <?php the_field('video_link'); ?>
        </div>
        <div class="post-header-wrapper">
		        <?php
		        if ( is_singular() ) :
			        ?>
                <div class="lesson-header-title"><?php echo mb_strimwidth(get_the_title(),0,63,'...'); ?></div>
<!--                <h1 class="entry-title">--><?php //echo mb_strimwidth(get_the_title(),0,63,'...'); ?><!--</h1>-->
		        <?php
		        else :
			        the_title( '<div class="lesson-header-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">',
				        '</a></div>' );
		        endif;
		        ?>
                <span>
                    <svg width="14" height="14" class="icon comment-silver-icon">
                            <use xlink:href="<?php echo get_template_directory_uri().
                                                        '/assets/images/sprite.svg#clock'?>"></use>
                        </svg>&nbsp&nbsp<?php echo get_the_date( 'j F, H:i' ) ?>
                </span>
        </div>


	</div> <!--container-->
    </header>
<!--	Заголовок поста (конец) -->


<!--	Содержимое поста  -->
    <div class="container">
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
				'before' => '<div class="page-links">' . esc_html__( 'Страницы:', 'universal-theme' ),
				'after'  => '</div>',
			)
		);
		?>
	</div><!-- .entry-content -->
<!--	Содержимое поста (конец) -->

<!--	Подвал поста  -->
	<footer class="entry-footer">
	<?php

		$tags_list = get_the_tag_list( '', esc_html_x( '', 'list item separator', 'universal-theme' ) );
		if ( $tags_list ) {
			printf( '<div class="tags-links">' . esc_html__( '%1$s', 'universal-theme' ) . '</div>', $tags_list );
		}
	?>
	<?php meks_ess_share(); ?>
	</footer><!-- .entry-footer -->
</div><!--container-->
</article>
