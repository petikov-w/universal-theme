<?php
    get_header('post');
?>



<main class="site-main">

	<?php
	while ( have_posts() ) :
		the_post();

		get_template_part( 'template-parts/content', get_post_type() );

		the_post_navigation(
			array(
				'prev_text' => '<span class="nav-subtitle">' . esc_html__( 'Назад', 'universal-theme' ) . '</span>' ,
				'next_text' => '<span class="nav-subtitle">' . esc_html__( 'Вперед', 'universal-theme' ) . '</span>' ,
			)
		);?>
    <?php
		// If comments are open or we have at least one comment, load up the comment template.
		if ( comments_open() || get_comments_number() ) :
			comments_template();
		endif;

	endwhile; // End of the loop.
	?>

</main><!-- #main -->
<?php
    get_footer();
?>
