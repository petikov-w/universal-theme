<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package universal-example
 */

if ( ! is_active_sidebar( 'group-posts' ) ) {
	return;
}
?>

<aside class="post-area">
	<?php dynamic_sidebar( 'group-posts' ); ?>
</aside><!-- #secondary -->

