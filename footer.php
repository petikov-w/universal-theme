

<footer class="footer">
    <div class="container">
        <?php
        if ( !is_page( 'thanksyou' )) {
        ?>
            <div class="footer-form-wrapper">
                <h3 class="footer-form-title"><?php echo __( 'Подпишитесь на нашу рассылку', 'universal' ) ?></h3>
                <form action="https://app.getresponse.com/add_subscriber.html" accept-charset="utf-8" method="post"
                      class="footer-form">
                    <!-- Поле Email (обязательно) -->
                    <input required type="text" name="email" placeholder="Введите email" class="input fmedia footer-form-input">
                    <!-- Токен списка -->
                    <!-- Получить API ID на: https://app.getresponse.com/campaign_list.html -->
                    <input type="hidden" name="campaign_token" value="BeKOk" />
                    <!-- Добавить подписчика в цикл на определенный день (по желанию) -->
                    <input type="hidden" name="start_day" value="0" />
                    <!-- Страница благодарности -->
                    <input type="hidden" name="thankyou_url" value="<?php echo home_url('thanksyou') ?>"/>
                    <!-- Кнопка подписаться -->
                    <button type="submit" class="more-button"><?php echo __( 'Подписаться', 'universal' ) ?></button>
                </form>
            </div>
        <?php } ?>


        <?php
            if ( ! is_active_sidebar( 'sidebar-footer' ) ) {
                return;
            }
        ?>

        <div class="footer-menu-bar">
            <?php dynamic_sidebar( 'sidebar-footer' ); ?>
        </div>
        <div class="footer-info-main">
            <div class="footer-info">
		        <?php
		        get_template_part( 'template-parts/content', 'footer-logo' );

		        wp_nav_menu( [
			        'theme_location'  => 'footer_menu',
			        'container'       => 'nav',
			        'menu_class'      => 'footer-nav',
			        'echo'            => true,
		        ] );

		        ?>
            </div>
            <?php
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
                <div class="footer-telefon">
                    <?php $telefon = get_field('telefon',134);
                    if ($telefon) {echo  '<a href="tel:'. $telefon . '">' . $telefon . '</a>';} ?>
                </div>
            </span>
        </div>
    </div>
</footer>

<!--===========================================-->
<?php wp_footer();?>
	</body>
</html>