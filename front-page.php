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
        <?php
            $args_list = array(
                'posts_per_page' => 1,
                'category_name'  => 'javascript, css, html, web-design'
            );
            cycle_wp_query($args_list, 'hero-left');
        ?>
		</div><!-- /.left -->
		<div class="right">
            <h3 class="recommend">Рекомендуем</h3>
            <ul class="posts-list">
	            <?php
                    $args_postlist = array(
                        'posts_per_page' => 5,
                        'offset' => 1,
                        'category_name'  => 'javascript, css, html, web-design'
                    );
                    cycle_wp_query($args_postlist, 'hero-right');
	            ?>
            </ul>
		</div><!-- /.right -->
	</div><!-- /.hero -->
</div><!-- /.container -->
</main>

<div class="container">
    <ul class="article-list">
	    <?php
	    $args_articlelist = array(
		    'posts_per_page' => 4,
		    'category_name' => 'articles',
		    'category__not_in' => 20,
	    );
	    cycle_wp_query($args_articlelist, 'articlelist');
	    ?>
    </ul>
    <div class="main-grid">
        <ul class="article-grid">
	        <?php
	        $args_articlegrid = array(
		        'posts_per_page' => 7,
		        'tag' => $tag_filters,
	        );
	        cycle_wp_query_switch($args_articlegrid , 'article-grid');
	        ?>
    </ul>
<!--        Подключаем сайдбар  -->
        <?php get_sidebar('main') ?>
    </div>
</div><!-- /.container -->

<?php
    $args_gation = array(
        'posts_per_page' => 1,
        'category_name' => 'investigation',
    );
    cycle_wp_query($args_gation, 'investigation');
?>
    <div class="container">
        <ul class="article-list-2">
	        <?php
	        $args_list_2 = array(
		        'posts_per_page' => 6,
		        'category__not_in' => 20,
	        );
	        cycle_wp_query($args_list_2, 'articlelist2');
	        ?>
        </ul>
    </div>

<?php
get_footer();