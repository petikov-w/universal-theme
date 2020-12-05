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
        <div class="post-header-wrapper">
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
		        //var_dump($pred_post);
		        ?>

                <div class="navs">
                    <a class="navs-pred" href="/"><svg width="18" height="17" class="icon arrow-icon">
                            <use xlink:href="<?php echo get_template_directory_uri().
					                                    '/assets/images/sprite.svg#home'?>">
                            </use>
                        </svg>&nbsp&nbspНа главную</a>
			        <?php
			        if ($pred_post!="") {
				        ?>
                        <a class="navs-pred" href="<?php echo get_permalink( $pred_post ) ?>">
                            <svg width="19" height="15" class="icon arrow-icon">
                                <use xlink:href="<?php echo get_template_directory_uri().
						                                    '/assets/images/sprite.svg#left-arrow'?>">
                                </use>
                            </svg>&nbsp&nbspНазад</a>
				        <?php
			        }
			        ?>
			        <?php
			        if ($next_post!="") {
				        ?>
                        <a class="navs-next" href="<?php echo get_permalink( $next_post ) ?>">
                            Вперед<svg width="19" height="15" class="icon arrow-icon">
                                <use xlink:href="<?php echo get_template_directory_uri().
						                                    '/assets/images/sprite.svg#arrow'?>"></use>
                            </svg>
                        </a>
				        <?php
			        }
			        ?>
                </div>
            </div>
            <div class="cons">
		        <?php
		        if ( is_singular() ) :
			        ?>
                    <div class="title-bookmark">
                        <h1 class="entry-title"><?php echo mb_strimwidth(get_the_title(),0,63,'...'); ?></h1>
                        <svg width="21" height="27" class="icon icon-bookmark bookmark">
                            <use xlink:href="<?php echo get_template_directory_uri().
		                                                '/assets/images/sprite.svg#bookmark'?>"></use>
                        </svg>
                    </div>


		        <?php
		        else :
			        the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">',
				        '</a></h2>' );
		        endif;
		        ?>

                <span class="entry-excerpt"><?php echo mb_strimwidth(get_the_excerpt(),0,200,'...'); ?></span>
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
            <div class="post-author">
                <?php $author_id=get_the_author_meta('ID'); ?>
                <div class="author-post-info">
                    <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar-lr">
                    <span class="author-name"><?php the_author() ?></span>
                    <span class="author-rank"><?php echo get_user_role($author_id) ?></span>
                    <span class="author-posts"><?php echo plural_form(count_user_posts($author_id),
                        array('статья','статьи','статей')) ?></span>
                </div>
                <a href="<?php echo get_author_posts_url($author_id)?>" class="author">Страница автора</a>
            </div>
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
    <!--        Подключаем сайдбар  -->
	<?php get_sidebar('group-posts') ?>
<!--	Подвал поста (конец)  -->
</article>
