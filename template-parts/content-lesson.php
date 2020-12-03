<?php
/**
 * Шаблон для вывода постов
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-theme
 */

$teacher = get_the_terms( get_the_ID(), 'teacher' )[0]->name;
$genre = get_the_terms( get_the_ID(), 'genre' )[0]->name;
$url_teacher=get_term_link(get_the_terms( get_the_ID(), 'teacher' )[0]->term_id, 'teacher' );
?>
<!--	Заголовок поста  -->

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header <?php echo get_post_type() ?>-header" style="background: linear-gradient(0deg,
	                              rgba(38, 45, 51, 0.75),	rgba(38, 45, 51, 0.75))">
	<div class="container">
        <div class="genre">
	        <?php
	        printf(
		        '<a href="%s" class="genre-link %s">%s</a>',
		        esc_url(get_term_link(get_the_terms( get_the_ID(), 'genre' )[0]->term_id, 'genre' )),
		        esc_html(get_the_terms( get_the_ID(), 'genre' )[0]->slug),
		        esc_html(get_the_terms( get_the_ID(), 'genre' )[0]->name)
	        );
	        ?>
        </div>

        <div class="video">
            <?php get_template_part( 'template-parts/content', 'videohosts' ); ?>
        </div>

        <div class="post-header-wrapper">
		        <?php if ( is_singular() ) : ?>
                <div class="lesson-header-title">
                    <?php echo mb_strimwidth(get_the_title(),0,63,'...'); ?>
                </div>
		        <?php
		        else :
			        the_title( '<div class="lesson-header-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">',
				        '</a></div>' );
		        endif;
		        ?>
                <div class="teacher">Преподователь:&nbsp&nbsp
                    <a href="<?php echo $url_teacher ?>"> <span class="fio-teacher"><?php echo $teacher ?></span></a>
                </div>
                <span class="clock">
                    <svg width="14" height="14" class="icon comment-silver-icon">
                            <use xlink:href="<?php echo get_template_directory_uri().
                                                        '/assets/images/sprite.svg#clock'?>"></use>
                        </svg>&nbsp&nbsp<?php echo get_the_date( 'j F, H:i' ) ?>
                </span>
        </div>
		<?php
		?>


	</div> <!--container-->
    </header>

<!--	Заголовок поста (конец) -->


<!--	Содержимое поста  -->
    <div class="container">
<!--	<div class="entry-content">-->
<!--        --><?php
//            $cur_terms = get_the_terms( $post->ID, 'lesson' );
//            printss($cur_terms);
//        ?>

	<div class="lesson-content">
		<?php
		the_content(
			sprintf(
				wp_kses(
				/* translators: %s: Name of current post. Only visible to screen readers */
					__( 'Continue reading<span class="screen-reader-text"> "%s"</span>', 'universal' ),
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
				'before' => '<div class="page-links">' . esc_html__( 'Страницы:', 'universal' ),
				'after'  => '</div>',
			)
		);
		?>
	</div><!-- .entry-content -->
<!--	Содержимое поста (конец) -->

<!--	Подвал поста  -->
	<footer class="entry-footer">
	<?php

		$tags_list = get_the_tag_list( '', esc_html_x( '', 'разделитель элементов списка', 'universal' ) );
		if ( $tags_list ) {
			printf( '<div class="tags-links">' . esc_html__( '%1$s', 'universal-theme' ) . '</div>', $tags_list );
		}
	?>
	<?php meks_ess_share(); ?>
	</footer><!-- .entry-footer -->
</div><!--container-->
</article>
