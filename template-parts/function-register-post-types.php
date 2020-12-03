<?php
add_action( 'init', 'register_post_types' );
function register_post_types(){
	register_post_type( 'lesson', [
		'label'  => null,
		'labels' => [
			'name'               => __('Уроки', 'universal' ), // основное название для типа записи
			'singular_name'      => __('Урок', 'universal' ), // название для одной записи этого типа
			'add_new'            => __('Добавить урок', 'universal' ), // для добавления новой записи
			'add_new_item'       => __('Добавление урока', 'universal' ), // заголовка у вновь создаваемой записи в админ-панели.
			'edit_item'          => __('Редактирование урока', 'universal' ), // для редактирования типа записи
			'new_item'           => __('Новый урок', 'universal' ), // текст новой записи
			'view_item'          => __('Смотреть уроки', 'universal' ), // для просмотра записи этого типа.
			'search_items'       => __('Искать уроки', 'universal' ), // для поиска по этим типам записи
			'not_found'          => __('Не найдено', 'universal' ), // если в результате поиска ничего не было найдено
			'not_found_in_trash' => __('Не найдено в корзине', 'universal' ), // если не было найдено в корзине
			'parent_item_colon'  => '', // для родителей (у древовидных типов)
			'menu_name'          => __('Уроки', 'universal' ), // название меню
		],
		'description'         => __('Раздел с видеоуроками', 'universal' ),
		'public'              => true,
		'publicly_queryable' => true,  //******************
		// 'publicly_queryable'  => null, // зависит от public
		// 'exclude_from_search' => null, // зависит от public
		'show_ui'             => true, // зависит от public ******
		// 'show_in_nav_menus'   => null, // зависит от public
		'show_in_menu'        => true, // показывать ли в меню адмнки
		// 'show_in_admin_bar'   => null, // зависит от show_in_menu
		'show_in_rest'        => true, // добавить в REST API. C WP 4.7
		'rest_base'           => null, // $post_type. C WP 4.7
		'menu_position'       => 5,
		'menu_icon'           => 'dashicons-welcome-learn-more',
		'capability_type'   => 'post',
		//'capabilities'      => 'post', // массив дополнительных прав для этого типа записи
		//'map_meta_cap'      => null, // Ставим true чтобы включить дефолтный обработчик специальных прав
		'hierarchical'        => false,
		'supports'            => [ 'title', 'thumbnail', 'custom-fields'], // 'title','editor','author','thumbnail','excerpt','trackbacks','custom-fields','comments','revisions','page-attributes','post-formats'
		//'taxonomies'          => ['teacher'],
		'has_archive'         => true,
		'rewrite'             => true,
		'query_var'           => true,
	] );
}