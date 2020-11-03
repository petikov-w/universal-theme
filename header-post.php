<!doctype html>
<html <?php language_attributes();?>>
<head>
	<meta charset="<?php bloginfo('charset'); ?>">
<!--	<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>Universal-post</title>
	<?php wp_head();?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open();?>
<header class="header-single">
    <div class="container">
        <div class="header-wrapper-single">
	        <?php
	          // Вывод основного меню сайта
	          wp_nav_menu( [
		        'theme_location'  => 'header_menu',
		        'container'       => 'nav',
		        'container_class' => 'header-nav',
		        'menu_class'      => 'header-menu header-menu-single',
		        'echo'            => true,
	        ] );
	        // Вывод поля для поискового запроса
            ?>
                <?php echo get_search_form(); ?>
                <a href="#" class="header-menu-toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
        </div>
    </div>
</header>