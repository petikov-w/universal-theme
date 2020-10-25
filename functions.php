<?php
// добавление расширенных возможностей
if (! function_exists('universal_theme_setup')) :
	function universal_theme_setup() {
		// добавление тега title
		add_theme_support('title-tag');
		// добавление миниатюр
		add_theme_support( 'post-thumbnails', array( 'post' ) );

		if (function_exists('add_image_size')){
			add_image_size('post-img',335,195,true);
		}

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
	wp_enqueue_style( 'Roboto-Slab', '//fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap');
}

add_action( 'wp_enqueue_scripts', 'enqueue_universal_style' );

// отключаем строку для вызова админ панели вверху сайта
add_filter('show_admin_bar', '__return_false');

// отключаем создание миниатюр файлов для указанных размеров
add_filter( 'intermediate_image_sizes', 'delete_intermediate_image_sizes' );
function delete_intermediate_image_sizes( $sizes ){
	// размеры которые нужно удалить
	return array_diff( $sizes, [
		'medium_large',
		'large',
		'1536x1536',
		'2048x2048',
	] );
}

// Регистрация области виджетов

function universal_theme_widgets_init() {
	// Сайдбар для вывода трех виджетов (файлом, тегами и соцсетями) на главной странице
	register_sidebar(
		array(
			'name'          => esc_html__( 'Сайдбар на главной', 'universal-theme' ),
			'id'            => 'main',
			'description'   => esc_html__( 'Добавте виджеты здесь', 'universal-theme' ),
			'before_widget' => '<div id="%1$s" class="widget %2$s">',
			'after_widget'  => '</div>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		)
	);

	// Сайдбар для вывода виджета последних постов на главной странице
	register_sidebar(
		array(
			'name' => esc_html__('Сайдбар на главной - 2', 'universal-theme' ),
			'id' => 'main-2',
			'description' => esc_html__('Добавте виджеты здесь', 'universal-theme' ),
			'before_widget' => '<div id="%1$s" class="widget %2$s">',
			'after_widget' => '</div>',
			'before_title' => '<h2 class="widget-title">',
			'after_title' => '</h2>',
		)
	);
}
add_action( 'widgets_init', 'universal_theme_widgets_init' );


// Настройка виджета облака тегов
function universal_tag_cloud($args){
	$args['smallest']= 14;
	$args['largest']= 14;
	$args['unit']= 'px';
	$args['order']= 'DESC';
	$args['number']= 10;

	return $args;
}
add_filter('widget_tag_cloud_args','universal_tag_cloud');


// Регистрация нового виджета - Полезные файлы (downloader)
get_template_part( 'template-parts/function', 'widget-downloader' );

// Регистрация нового виджета - Наши соцсети (socialnetwork)
get_template_part( 'template-parts/function', 'widget-socialnetwork' );

// Регистрация нового виджета - Недавно опубликованные посты (resent_posts)
get_template_part( 'template-parts/function', 'widget-recent-posts' );

// Мои функции
get_template_part( 'template-parts/function', 'my-functions' );
get_template_part( 'template-parts/function', 'cycle-wp-query' );

