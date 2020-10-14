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

//========================================================
//=================== Мои функции ========================
//========================================================

// Функция меняющая цвет рубрики в зависимости от её названия
function category_colors ($colors) {
	foreach($colors as $item => $item_count) {
		if ($item==get_the_category()[0]->name) {
			$color = $item_count;?>
			<a class="category-color" href="<?php echo get_category_link(get_the_category()[0]->term_id) ?>"
			   style="color:<?= $color; ?>"><?php echo $item  ?></a>
			<?php
		}
	}
}

function category_colors2 ($colors, $category) {
	foreach($colors as $item => $item_count) {
		if ($item==$category->name) {
			$color = $item_count;?>
            <a class="category-color" href="<?php echo get_category_link($category->term_id) ?>"
               style="color:<?= $color; ?>"><?php echo $item  ?></a>
			<?php
		}
	}
}