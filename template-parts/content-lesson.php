<?php
/**
 * Шаблон для вывода постов
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-theme
 */

?>

<!--<iframe src="https://player.vimeo.com/video/482125225" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>-->
<!--<p><a href="https://vimeo.com/482125225">Venrez show me Vimeo</a> from <a href="https://vimeo.com/user20567042">Diana</a> on <a href="https://vimeo.com">Vimeo</a>.</p>-->


<!--<iframe src="https://player.vimeo.com/video/90754460" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>-->
<!--<p><a href="https://vimeo.com/90754460">Видеоинструкция по  загрузки видео на VIMEO</a> from <a href="https://vimeo.com/mosobltv">360 Подмосковье</a> on <a href="https://vimeo.com">Vimeo</a>.</p>-->

<!--<iframe src="https://player.vimeo.com/video/90754460" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>-->


<!--	Заголовок поста  -->
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header <?php echo get_post_type() ?>-header" style="background: linear-gradient(0deg,
	                              rgba(38, 45, 51, 0.75),	rgba(38, 45, 51, 0.75))">
	<div class="container">
        <div class="video">
            <?php

            if (is_youtube(get_field('video_link'))>0) { ?>
            <iframe width="100%" height="450" src="<?php echo 'https://www.youtube.com/embed/' . dsd(get_field('video_link'),'?v='); ?>" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            <?php } ?>

        </div>
<!--        https://www.youtube.com/embed/uhyLPZ5_TZw-->
        <div class="post-header-wrapper">
		        <?php
		        if ( is_singular() ) :
			        ?>
                <div class="lesson-header-title"><?php echo mb_strimwidth(get_the_title(),0,63,'...'); ?></div>
<!--                <h1 class="entry-title">--><?php //echo mb_strimwidth(get_the_title(),0,63,'...'); ?><!--</h1>-->
<!--                --><?php //echo dsd(get_field('video_link'),'?v='); ?>
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
