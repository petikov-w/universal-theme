

<footer class="footer">
    <div class="container">

        <?php
            if ( ! is_active_sidebar( 'sidebar-footer' ) ) {
                return;
            }
        ?>

        <div class="footer-menu-bar">
            <?php dynamic_sidebar( 'sidebar-footer' ); ?>
        </div>
        <div class="footer-info">
            <?php
                wp_nav_menu( [
                    'theme_location'  => 'footer_menu',
                    'container'       => 'nav',
                    'menu_class'      => 'footer-nav',
                    'echo'            => true,
                ] );

            $instance = array(
	            'facebook'=>'https://www.facebook.com',
	            'instagram'=>'https://www.instagram.com',
	            'youtube'=>'https://youtube.com',
	            'twitter'=>'https://twitter.com',
	            'title'=>'',
            );
            $args = array(
	            'before_widget' => '<div class="footer-social">',
	            'after_widget' => '</div>',
            );

            the_widget( 'Socialnetwork_Widget', $instance, $args );
            ?>
        </div>
        <div class="footer-text-wrapper">
	        <?php dynamic_sidebar( 'sidebar-footer-text' ); ?>
            <span class="footer-copyright">
                <?php echo date('Y').' &copy '.get_bloginfo('name'); ?>
            </span>
        </div>
    </div>
</footer>

<!--===========================================-->
<?php wp_footer();?>
	</body>
</html>