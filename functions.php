<?php
// добавление расширенных возможностей
if (! function_exists('universal_theme_setup')) :
	function universal_theme_setup() {
		// добавление тега title
		add_theme_support('title-tag');
		// добавление миниатюр
		add_theme_support( 'post-thumbnails', array( 'post' ) );

		if (function_exists('add_image_size')){
//			add_image_size('post-img',335,195,true);
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
	wp_enqueue_style( 'swiper-slider', get_template_directory_uri() . '/assets/css/swiper-bundle.min.css','style', time());
	wp_enqueue_style( 'universal-theme', get_template_directory_uri() . '/assets/css/universal-theme.css','style', time());
	wp_enqueue_style( 'Roboto-Slab', '//fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap');
	wp_deregister_script( 'jquery-core' );
	wp_register_script( 'jquery-core', '//code.jquery.com/jquery-3.5.1.min.js');
	wp_enqueue_script( 'jquery' );
	wp_enqueue_script('swiper', get_template_directory_uri() . '/assets/js/swiper-bundle.min.js',null,time(),true);
	wp_enqueue_script('scripts', get_template_directory_uri() . '/assets/js/scripts.js','swiper',time(),true);
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

	// Сайдбар для вывода группы меню в подвале на главной странице
	register_sidebar(
		array(
			'name' => esc_html__('Меню в подвале', 'universal-theme' ),
			'id' => 'sidebar-footer',
			'description' => esc_html__('Добавте меню здесь', 'universal-theme' ),
			'before_widget' => '<section id="%1$s" class="footer-menu %2$s">',
			'after_widget' => '</section>',
			'before_title' => '<h2 class="footer-menu-title">',
			'after_title' => '</h2>',
		)
	);

	// Сайдбар для вывода группы меню в подвале на главной странице
	register_sidebar(
		array(
			'name' => esc_html__('Текст в подвале', 'universal-theme' ),
			'id' => 'sidebar-footer-text',
			'description' => esc_html__('Добавте текст здесь', 'universal-theme' ),
			'before_widget' => '<section id="%1$s" class="footer-text %2$s">',
			'after_widget' => '</section>',
			'before_title' => '',
			'after_title' => '',
		)
	);

	// Сайдбар для вывода группы постов из той же категории, что и основной пост на странице поста
	register_sidebar(
		array(
			'name' => esc_html__('Группа постов', 'universal-theme' ),
			'id' => 'group-posts',
			'description' => esc_html__('Добавте виджеты здесь', 'universal-theme' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget' => '</section>',
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

// ================== AJAX ========================================

add_action( 'wp_enqueue_scripts', 'adminAjax_data', 99 );
function adminAjax_data(){
wp_localize_script( 'jquery', 'adminAjax',
		array(
			'url' => admin_url('admin-ajax.php')
		)
	);
}

//-----------------------------------------------------------------

add_action('wp_ajax_contacts_form', 'ajax_form');
add_action('wp_ajax_nopriv_contacts_form', 'ajax_form');
function ajax_form() {
	$contact_name = $_POST['contact_name'];
	$contact_email = $_POST['contact_email'];
	$contact_comment = $_POST['contact_comment'];
	$message = 'Пользователь ' . $contact_name . ' задал вопрос "' . $contact_comment . '". Его email для связи: '
	           . $contact_email . ' .';
	$headers = "From: universal.loc <admin@first.kroxplus.ru>\r\nContent-type: text/plain; charset=UTF-8\r\n";

	$return_path = '-f admin@first.kroxplus.ru';

	$send_message = mail('developer-krox@yandex.ru', 'Новая заявка', $message, $headers);
	if ($send_message){
		echo 'Все получилось!';
	} else {echo 'Где-то ошибка!';}
	wp_die();
}



//===================== AJAX (конец) ==============================


// Регистрация нового виджета - Полезные файлы (downloader)
get_template_part( 'template-parts/function', 'widget-downloader' );

// Регистрация нового виджета - Наши соцсети (socialnetwork)
get_template_part( 'template-parts/function', 'widget-socialnetwork' );

// Регистрация нового виджета - Недавно опубликованные посты (resent_posts)
get_template_part( 'template-parts/function', 'widget-recent-posts' );

// Регистрация нового виджета - Посты в текущей категории (posts_in_current_category)
get_template_part( 'template-parts/function', 'widget-posts-in-current-category' );

// Мои функции
get_template_part( 'template-parts/function', 'my-functions' );
get_template_part( 'template-parts/function', 'cycle-wp-query' );

function plural_form($number, $after) {
	$cases = array (2, 0, 1, 1, 1, 2);
	echo $number.' '.$after[ ($number%100>4 && $number%100<20)? 2: $cases[min($number%10, 5)] ];
}