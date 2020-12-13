<?php
use ru\universal_theme\variables;
require_once 'variables.php';
$tag_filters = 'populyarnoe';
get_header();
//printss(get_locale());
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
            <h3 class="recommend"><?php _e('Рекомендуем', 'universal') ?></h3>
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
		    'post_type' => 'lesson',
	    );
	    cycle_wp_query($args_articlelist, 'lessonlist');
	    ?>
    </ul>
    <?php
    ?>

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
<!--    <div class="container">-->
    <div class="container articles-grid">
        <ul class="article-list-2">
	        <?php
	        $args_list_2 = array(
		        'posts_per_page' => 6,
		        'category__not_in' => 20,
	        );
	        cycle_wp_query($args_list_2, 'articlelist2');
	        ?>
        </ul>
        <!--        Подключаем сайдбар  -->
	    <?php get_sidebar('main-2'); ?>

    </div>


    <div class="special">
        <div class="container">
            <div class="special-grid">
<!--                ----------------------------------------------------->
	            <?php
	            $args_photo_report = array(
		            'posts_per_page' => 1,
		            'category_name' => 'photo-report',
	            );
	            cycle_wp_query($args_photo_report, 'photo-report');
	            ?>
<!--                ----------------------------------------------------->
            <div class="other other-grid">
                <div class="other-grid-item other-gri-01">
                    <img src="<?php echo get_template_directory_uri().'/assets/images/image-career.png' ?>" alt=""
                         class="image-career">
                    <span class="oval"></span>
	                <?php
	                $args_career = array(
		                'posts_per_page' => 1,
		                'category_name' => 'career',
	                );
	                cycle_wp_query($args_career, 'career');
                    ?>

                </div>
                <div class="other-grid other-gri-02">
	                <?php
	                $args_other = [
		                'posts_per_page' => 2,
		                'category_name' => 'javascript, css, html, web-design',
	                ];
	                cycle_wp_query_switch2($args_other, 'other');
	                ?>
                </div>
            </div>
            </div>
        </div>
    </div>

<?php
get_footer();