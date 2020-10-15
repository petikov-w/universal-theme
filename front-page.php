<?php
use ru\universal_theme\variables;
require_once 'variables.php';
$tag_filters = 'популярное';
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
                        <? category_colors2(variables::$color_category, get_the_category()[0]); ?>
<!--                        --><?// category_colors(variables::$color_category); ?>
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
		    'tag' => $tag_filters,
//		    'tag' => 'популярное',
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
                        <div class="top-blc-01">

                            <a href="<?php echo get_the_permalink() ?>">
                                <div class="left-blc">
                                    <span class="category-info2"><?php echo get_the_category()[0]->name ?></span>
                                    <span class="article-title-3"><p><?php the_title() ?></p> </span>
                                    <div class="exp-txt2"><?php echo mb_strimwidth(get_the_excerpt(),0,200,'...'); ?></div>
                                </div>
                            </a>

<!--                            <div class="img-blc">-->
<!--                                <img src="--><?php //echo get_the_post_thumbnail_url()?><!--" alt="" class="img2">-->
<!--                            </div>-->
                        </div>
                        <div class="bottom-blc-top-line"></div>
                        <div class="bottom-blc">
                            <a href="<?php echo get_author_posts_url($author_id)?>" >
                            <div class="author-blc">
                                        <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar3">
                                        <span class="author-name3"><?php the_author() ?></span>
                                        <span class="author-desc"><?php echo mb_strimwidth(get_the_author_meta('description'),0,40,'...'); ?></span>
                                        <img class="icon-comment" src="<?php echo get_template_directory_uri().'/assets/images/comment.svg' ?>" alt="">
                                        <span class="comments-counter"><?php comments_number('0','1','%'); ?></span>
                            </div>
                            </a>
                        </div>
                    </li>
<!--                   --------------------------- 1 статья (конец блока) ------------------>
                    <?php
                    break;

                   case '2': ?>
<!--                   ---------------------------- 2 статья-------------------------------->
                       <li class="article-grid-item article-gri-02 csm">
                           <img class="img-cs2" src="<?php echo get_the_post_thumbnail_url()?>" alt="">
                           <div class="sss">

                                   <div class="top-blc">
                                       <a href="<?php echo get_the_permalink() ?>">
                                       <span class="tag-info"><?php echo $tag_filters ?></span>
                                       </a>
                                   </div>

                               <a href="<?php echo get_the_permalink() ?>">
                               <div class="bottom-blc2">
                                   <span class="category-info"><?php echo get_the_category()[0]->name ?></span>
                                   <span class="article-title-2"><p><?php the_title() ?></p> </span>

	                               <?php $author_id=get_the_author_meta('ID') ?>
                                   <div class="author2">
                                       <a href="<?php echo get_author_posts_url($author_id)?>" class="author2">
                                           <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar2">
                                           <div class="author-bio2">
                                               <span class="author-name2"><?php the_author() ?></span>
                                               <a href="<?php echo get_the_permalink() ?>">
                                               <div class="date-comm-like">
                                                   <span class="date-post2"><?php echo get_the_date('j F') ?></span>
                                                   <img class="comment" src="<?php echo get_template_directory_uri().'/assets/images/comment-white.svg' ?>" alt="">
                                                   <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                                                   <img class="like" src="<?php echo get_template_directory_uri().'/assets/images/heart.svg' ?>" alt="">
                                                   <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                                               </div>
                                               </a>
                                           </div>
                                       </a>
                                   </div>
                               </div>
                               </a>
                           </div>
                       </li>
<!--                   ---------------------------- 2 статья (конец блока) ----------------->
                       <?php
                       break;


				    case '3': ?>
<!--                   ---------------------------- 3 статья-------------------------------->
<!--                   ---------------------------- Чек-лист ------------------------------->
                        <li class="article-grid-item">
                            <span class="social-text">Чек-лист</span>
                        </li>
<!--                   ---------------------------- Чек-лист (конец блока) ----------------->
<!--                   ---------------------------- Облако тегов --------------------------->
                        <li class="article-grid-item article-gri-03">
                            <span class="social-text">Облако тегов</span>
                        </li>
<!--                   ---------------------------- Облако тегов (конец блока) ------------->
                        <li class="article-grid-item article-gri-04 csm">
                            <a href="<?php echo get_the_permalink() ?>">
                                <img class="img-cs3" src="<?php echo get_the_post_thumbnail_url()?>" alt="">
                                <span class="cs3"><p><?php echo mb_strimwidth(get_the_title(),0,44,'...'); ?></p></span>
                            </a>
                        </li>
<!--                   ----------------------------- 3 статья (конец блока) ---------------->
					    <?php
					    break;

				    case '4': ?>
<!--                   ---------------------------- 4 статья-------------------------------->
                        <li class="article-grid-item">
                            <a href="<?php echo get_the_permalink() ?>">
                                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            </a>
                            <div class="date-post"><?php echo get_the_date('j F') ?></div>
                        </li>
<!--                   ---------------------------- 4 статья (конец блока)------------------>
					    <?php
					    break;

				    case '5': ?>
<!--                   ---------------------------- 5 статья-------------------------------->
                        <li class="article-grid-item">
                            <a href="<?php echo get_the_permalink() ?>">
                                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            </a>
                                <div class="date-post"><?php echo get_the_date('j F') ?></div>
                        </li>
<!--                   ---------------------------- 5 статья (конец блока) ----------------->
					    <?php
					    break;

				    case '6': ?>
<!--                   ---------------------------- 6 статья ------------------------------->
                        <li class="article-grid-item">
                            <a href="<?php echo get_the_permalink() ?>">
                                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            </a>
                            <div class="date-post"><?php echo get_the_date('j F') ?></div>
                        </li>
<!--                   --------------------------- 6 статья (конец блока) ------------------>
					    <?php
					    break;

				    case '7': ?>
<!--                   ---------------------------- 7 статья ------------------------------->
                        <li class="article-grid-item">
                            <a href="<?php echo get_the_permalink() ?>">
                                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
                            </a>
                            <div class="date-post"><?php echo get_the_date('j F') ?></div>
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

        <li class="article-grid-item social-blc">
            <span class="social-text">Наши соцсети</span>
            <div class="set-social-icons">
                <a href="#"><img width="10" height="18" class="icon-social facebook" src="<?php echo get_template_directory_uri().'/assets/images/facebook.svg' ?>" alt="facebook"></a>
                <a href="#"><img class="icon-social twitter" src="<?php echo get_template_directory_uri().'/assets/images/twitter.svg' ?>" alt="twitter"></a>
                <a href="#"><img class="icon-social youtube" src="<?php echo get_template_directory_uri().'/assets/images/youtube.svg' ?>" alt="youtube"></a>
            </div>
        </li>
    </ul>

</div>

<?php
get_footer();