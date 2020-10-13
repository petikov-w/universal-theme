<?php
get_header();
?>
<main class="front-page-header">
<div class="container">
	<div class="hero">
		<div class="left">
<!--            ===================================================================-->

			<?php
			// Объявляем глобальную переменнную $post
			global $post;

			$myposts = get_posts([
				'numberposts' => 1,
				'category_name'    => 'javascript, css, html, web-design'
			]);
			// проверяем есть ли посты в сформированном массиве $myposts
			if( $myposts ){
				// если есть запускаем цикл вывода постов
				foreach( $myposts as $post ){
					setup_postdata( $post ); // устанавливаем данные (из-за использования цикла get_posts)
					?>
<!--              --------------------------------Вывод постов----------------------------------------------   -->

                    <img src="<?php the_post_thumbnail_url(); ?>" alt="" class="post-thumb">
                    <?php $author_id=get_the_author_meta('ID') ?>
                    <a href="<?php echo get_author_posts_url($author_id)?>" class="author">
                        <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar">
                        <div class="author-bio">
                            <span class="author-name"><?php the_author() ?></span>
                            <span class="author-rank">Должность</span>
                        </div>
                    </a><!-- /.author -->
                    <div class="post-text">
                        <?php the_category(); ?>
                        <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
                        <a href="<?php echo get_the_permalink(); ?>" class="more">Читать далее</a>
                    </div>
<!--              --------------------------------Вывод постов (конец) --------------------------------------   -->
            <?php
				}
			} else {
				// Постов не найдено
			}

			wp_reset_postdata(); // Сбрасываем $post
			?>
		</div><!-- /.left -->
		<div class="right">
            <h3 class="recommend">Рекомендуем</h3>
            <ul class="posts-list">
                <!--            ===================================================================-->
				<?php
				// Объявляем глобальную переменнную $post
				global $post;

				$myposts = get_posts([
					'numberposts' => 5,
					'offset' => 1,
					'category_name'  => 'javascript, css, html, web-design'
				]);
				// проверяем есть ли посты в сформированном массиве $myposts
				if( $myposts ){
					// если есть запускаем цикл вывода постов
					foreach( $myposts as $post ){
						setup_postdata( $post ); // устанавливаем данные (из-за использования цикла get_posts)
						?>
                        <!-- --------------------------------Вывод постов----------------------------------------------   -->
                        <li class="post">
							<?php the_category(); ?>
                            <a class="post-permalink" href="<?php echo get_the_permalink(); ?>">
                                <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
                            </a>

                        </li>
                        <!-- --------------------------------Вывод постов (конец) --------------------------------------  -->
						<?php
					}
				} else {
					// Постов не найдено
				}

				wp_reset_postdata(); // Сбрасываем $post
				?>
                <!--            ===================================================================-->

            </ul>
		</div><!-- /.right -->
	</div><!-- /.hero -->
</div><!-- /.container -->
</main>
<div class="container">
    <ul class="article-list">
        <!--            ===================================================================-->
		<?php
		// Объявляем глобальную переменнную $post
		global $post;

		$myposts = get_posts([
			'numberposts' => 4,
            'category_name'    => 'articles'
		]);
		// проверяем есть ли посты в сформированном массиве $myposts
		if( $myposts ){
			// если есть запускаем цикл вывода постов
			foreach( $myposts as $post ){
				setup_postdata( $post ); // устанавливаем данные (из-за использования цикла get_posts)
				?>
                <!-- --------------------------------Вывод постов----------------------------------------------   -->
                <li class="article-item">
                    <a class="article-permalink" href="<?php echo get_the_permalink(); ?>">
                        <h4 class="article-title"><?php echo mb_strimwidth(get_the_title(),0,55,'...'); ?></h4>
                    </a>
                    <img width="65" height="65" src="<?php echo get_the_post_thumbnail_url(null,'thumbnail')?>" alt="">

                </li>
                <!-- --------------------------------Вывод постов (конец) --------------------------------------  -->
				<?php
			}
		} else {
			// Постов не найдено
		}

		wp_reset_postdata(); // Сбрасываем $post
		?>
        <!--            ===================================================================-->

    </ul>
</div>

<?php
get_footer();