<?php
use ru\universal_theme\variables;
require_once 'variables.php';

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
                        <? category_colors(variables::$color_category); ?>
                        <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
                        <a href="<?php echo get_the_permalink(); ?>" class="more">Читать далее</a>
                    </div>
<!--              --------------------------------Вывод постов (конец) --------------------------------------   -->
            <?php
				}
			} else {?>
				<p>Постов не найдено</p>
                <?php
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
							<?php category_colors(variables::$color_category); ?>
                            <a class="post-permalink" href="<?php echo get_the_permalink(); ?>">
                                <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
                            </a>
                        </li>
                        <!-- --------------------------------Вывод постов (конец) --------------------------------------  -->
						<?php
					}
				} else {?>
                    <p>Постов не найдено</p>
				<?php
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
		} else {?>
            <p>Постов не найдено</p>
			<?php
		}
		wp_reset_postdata(); // Сбрасываем $post
		?>
        <!--            ===================================================================-->
    </ul>

    <!--            ===================================================================-->

    <ul class="article-grid">
        <!--            ===================================================================-->
	    <?php
	    global $post;

	    $query = new WP_Query( [
		    'posts_per_page' => 7,
	    ] );

	    if ( $query->have_posts() ) {
	        $cnt=0;
		    while ( $query->have_posts() ) {
			    $query->the_post();
			    $cnt++;
			    switch ($cnt) {
                    case '1': ?>
<!--                   --------------------------- 1 --------------------------------------->
                    <li class="article-grid-item article-gri-01">
                        <h4><?php the_title() ?></h4>
                    </li>
<!--                   --------------------------- 1 статья (конец блока) ------------------>
                    <?php
                    break;

                   case '2': ?>
<!--                   ---------------------------- 2 статья-------------------------------->
                       <li class="article-grid-item article-gri-02">
                           <h4><?php the_title() ?></h4>
                       </li>
<!--                   ---------------------------- 2 статья (конец блока) ----------------->
                       <?php
                       break;


				    case '3': ?>
<!--                   ---------------------------- 3 статья-------------------------------->
<!--                   ---------------------------- Чек-лист ------------------------------->
                        <li class="article-grid-item">
                            <h3>Чек-лист</h3>
                        </li>
<!--                   ---------------------------- Чек-лист (конец блока) ----------------->
<!--                   ---------------------------- Облако тегов --------------------------->
                        <li class="article-grid-item article-gri-03">
                            <h3>Облако тегов</h3>
                        </li>
<!--                   ---------------------------- Облако тегов (конец блока) ------------->
                        <li class="article-grid-item article-gri-04">
                            <div class="cs3">
							    <?php echo mb_strimwidth(get_the_title(),0,50,'...'); ?>
                            </div>
                        </li>
<!--                   ----------------------------- 3 статья (конец блока) ---------------->
					    <?php
					    break;

				    case '4': ?>
<!--                   ---------------------------- 4 статья-------------------------------->
                        <li class="article-grid-item">
                            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            <div class="date-post">15 сентября</div>
                        </li>
<!--                   ---------------------------- 4 статья (конец блока)------------------>
					    <?php
					    break;

				    case '5': ?>
<!--                   ---------------------------- 5 статья-------------------------------->
                        <li class="article-grid-item">
                            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            <div class="date-post">15 сентября</div>
                        </li>
<!--                   ---------------------------- 5 статья (конец блока) ----------------->
					    <?php
					    break;

				    case '6': ?>
<!--                   ---------------------------- 6 статья ------------------------------->
                        <li class="article-grid-item">
                            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            <div class="date-post">15 сентября</div>
                        </li>
<!--                   --------------------------- 6 статья (конец блока) ------------------>
					    <?php
					    break;

				    case '7': ?>
<!--                   ---------------------------- 7 статья ------------------------------->
                        <li class="article-grid-item">
                            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            <div class="date-post">15 сентября</div>
                        </li>
<!--                   ---------------------------- 7 статья (конец блока) ----------------->
					    <?php
					    break;

				    default:
                        break;
                }
	    ?>
			    <?php
		    }
	    } else {
		    // Постов не найдено
	    }

	    wp_reset_postdata(); // Сбрасываем $post
	    ?>
        <!--            ===================================================================-->
        <li class="article-grid-item">
            <h3>Социальные сети</h3>
        </li>
    </ul>

</div>

<?php
get_footer();