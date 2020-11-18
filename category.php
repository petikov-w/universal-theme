<?php
get_header();
?>
	<div class="category-wrapper">
        <div class="container">
            <h1 class="category-title">
		        <?php single_cat_title(); ?>
            </h1>
            <div class="posts-list">
		        <?php cycle_wp_posts('list-posts-in-category'); ?>
            </div>
        </div>
    </div>

<?php
get_footer();
