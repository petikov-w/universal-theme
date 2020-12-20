<!doctype html>
<html <?php language_attributes();?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <!--	<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Universal</title>
	<?php wp_head();?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open();?>
<header class="header">
    <div class="container">
        <div class="header-wrapper">

			<?php
			get_template_part( 'template-parts/content', 'header-logo' );

			// Вывод основного меню сайта
			wp_nav_menu( [
				'theme_location'  => 'header_menu',
				'container'       => 'nav',
				'container_class' => 'header-nav',
				'menu_class'      => 'header-menu',
				'echo'            => true,
			] );

			// Вывод поля для поискового запроса
			?>
			<?php
			function sas () {
				$ccc = 'dsdssdsd';
				return $ccc ;
			}
			?>
            <!--            <button class="form-submit" type="submit" onsubmit="--><?php //echo sas(); ?><!--">-->
            <!--                <svg width="30" height="30" class="icon white-icon" >-->
            <!--                    <use xlink:href="--><?php //echo get_template_directory_uri().'/assets/images/sprite.svg#global'?><!--"></use>-->
            <!--                </svg>-->
            <!--            </button>-->

            <svg width="30" height="30" class="icon white-icon" >
                <use xlink:href="<?php echo get_template_directory_uri().'/assets/images/sprite.svg#global'?>"></use>
            </svg>





			<?php echo get_search_form(); ?>
            <a href="#" class="header-menu-toggle">
                <span></span>
                <span></span>
                <span></span>
            </a>
        </div>
    </div>
</header>