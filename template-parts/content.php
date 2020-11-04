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
													?>)">
	<div class="container">
        <div class="nav-panel">
	        <?php
	        foreach ( get_the_category() as $category ) {
		        printf(
			        '<a href="%s" class="category-link %s">%s</a>',
			        esc_url(get_category_link($category)),
			        esc_html($category->slug),
			        esc_html($category->name)
		        );
	        }
	        $pred_post = get_previous_post(); // получили и записали в переменную объект предыдущего поста
	        $next_post = get_next_post(); // получили и записали в переменную объект предыдущего поста
	        ?>
            
            <div class="navs">
                <a class="navs-pred" href="/"><svg width="18" height="17" class="icon arrow-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
		                                            '/assets/images/sprite.svg#home'?>">
                        </use>
                    </svg>&nbsp&nbspНа главную</a>
                
                <a class="navs-pred" href="<?php echo get_permalink( $pred_post ) ?>">
                    <svg width="19" height="15" class="icon arrow-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
		                                            '/assets/images/sprite.svg#left-arrow'?>">
                        </use>
                    </svg>&nbsp&nbspНазад</a>
                <a class="navs-next" href="<?php echo get_permalink( $next_post ) ?>">
                    Вперед<svg width="19" height="15" class="icon arrow-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
                                                    '/assets/images/sprite.svg#arrow'?>"></use>
                    </svg>
                </a>
            </div>
        </div>


        <div class="cons">
	        <?php
	        if ( is_singular() ) :
		        the_title( '<h1 class="entry-title">', '</h1>' );
	        else :
		        the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">',
			        '</a></h2>' );
	        endif;
	        ?>
            <span class="entry-excerpt"><?php the_excerpt(); ?> </span>
            <div class="single-info">
            <span>
                <svg width="14" height="14" class="icon comment-silver-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
                                                    '/assets/images/sprite.svg#clock'?>"></use>
                    </svg>&nbsp&nbsp<?php echo get_the_date( 'j F, H:i' ) ?>
            </span>
                <span>
                <svg width="14" height="14" class="icon comment-silver-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
                                                    '/assets/images/sprite-like.svg#like'?>"></use>
                    </svg>&nbsp&nbsp<?php comments_number('0','1','%'); ?>
            </span>
                <span>
                <svg width="14" height="14" class="icon comment-silver-icon">
                        <use xlink:href="<?php echo get_template_directory_uri().
                                                    '/assets/images/sprite-like.svg#comment'?>"></use>
                    </svg>&nbsp&nbsp<?php comments_number('0','1','%'); ?>
            </span>
            </div>
        </div>

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

		$tags_list = get_the_tag_list( '', esc_html_x( ', ', 'list item separator', 'universal-theme' ) );
		if ( $tags_list ) {
			printf( '<span class="tags-links">' . esc_html__( '%1$s', 'universal-theme' ) . '</span>', $tags_list );
		}
	?>
	</footer><!-- .entry-footer -->
<!--	Подвал поста (конец)  -->
</article>
