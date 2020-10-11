<?php
// добавление расширенных возможностей
if (! function_exists('universal_theme_setup')) :
	function universal_theme_setup() {
		// добавление тега title
		add_theme_support('title-tag');
		// добавление миниатюр
		add_theme_support( 'post-thumbnails', array( 'post' ) );
		// добавление пользовательского логотипа
		add_theme_support( 'custom-logo', [
			'width'       => 163,
			'flex-height' => true,
			'header-text' => 'Universal',
			'unlink-homepage-logo' => false,
		] );
		// регистрация меню
			register_nav_menus( [
				'header_menu' => 'Меню в шапке',
				'footer_menu' => 'Меню в подвале'
			] );
	}
endif;

add_action( 'after_setup_theme', 'universal_theme_setup' );


// подключаем стили и скрипты
function enqueue_universal_style() {
	wp_enqueue_style( 'style', get_stylesheet_uri());
	wp_enqueue_style( 'universal-theme', get_template_directory_uri() . '/assets/css/universal-theme.css','style', time());
	wp_enqueue_style( 'Roboto-Slab', 'https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap');
}

add_action( 'wp_enqueue_scripts', 'enqueue_universal_style' );

// отключаем строку для вызова админ панели вверху сайта
add_filter('show_admin_bar', '__return_false');

