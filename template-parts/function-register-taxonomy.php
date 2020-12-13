<?php

function add_new_taxonomies() {
	register_taxonomy('teacher',
		array('lesson'),
		array(
			'hierarchical' => false,
			/* true - по типу рубрик, false - по типу меток,
			по умолчанию - false */
			'labels' => array(
				/* ярлыки, нужные при создании UI, можете
				не писать ничего, тогда будут использованы
				ярлыки по умолчанию */
				'name' => __('Преподователи', 'universal' ),
				'singular_name' => __('Преподаватель', 'universal' ) ,
				'search_items' => __('Найти преподавателя', 'universal' ) ,
				'all_items' => __('Все преподаватели', 'universal' ),
				'edit_item' => __('Редактировать преподавателя', 'universal' ),
				'update_item' => __('Изменить преподавателя', 'universal' ),
				'add_new_item' => __('Добавить преподавателя', 'universal' ),
				'new_item_name' => __('Название нового преподавателя', 'universal' ),
				'menu_name' => __('Преподаватели', 'universal' )
			),
			'show_admin_column' => true,
			'public' => true,
			/* каждый может использовать таксономию, либо
			только администраторы, по умолчанию - true */
			'show_in_nav_menus' => true,
			/* добавить на страницу создания меню */
			'show_ui' => true,
			/* добавить интерфейс создания и редактирования */
			'show_tagcloud' => false,
			/* нужно ли разрешить облако тегов для этой таксономии */
			'query_var' => true,
			/* разрешено ли использование query_var, также можно
			указать строку, которая будет использоваться в качестве
			него, по умолчанию - имя таксономии */
			'rewrite' => array(
				/* настройки URL пермалинков */
				'slug' => 'teacher', // ярлык
				'hierarchical' => false // разрешить вложенность

			),
		)
	);

	register_taxonomy('genre',
		array('lesson'),
		array(
			'hierarchical' => true,
			/* true - по типу рубрик, false - по типу меток,
			по умолчанию - false */
			'labels' => array(
				/* ярлыки, нужные при создании UI, можете
				не писать ничего, тогда будут использованы
				ярлыки по умолчанию */
				'name' => __('Жанры', 'universal' ),
				'singular_name' => __('Жанр', 'universal' ),
				'search_items' =>  __('Найти жанры', 'universal' ),
				'all_items' => __('Все жанры', 'universal' ),
				'edit_item' => __('Редактировать жанр', 'universal' ),
				'update_item' => __('Изменить жанр', 'universal' ),
				'add_new_item' => __('Добавить жанр', 'universal' ),
				'new_item_name' => __('Название нового жанра', 'universal' ),
				'menu_name' => __('Жанры', 'universal' )
			),
			'show_admin_column' => true,
			'public' => true,
			/* каждый может использовать таксономию, либо
			только администраторы, по умолчанию - true */
			'show_in_nav_menus' => true,
			/* добавить на страницу создания меню */
			'show_ui' => true,
			/* добавить интерфейс создания и редактирования */
			'show_tagcloud' => false,
			/* нужно ли разрешить облако тегов для этой таксономии */
			'query_var' => true,
			/* разрешено ли использование query_var, также можно
			указать строку, которая будет использоваться в качестве
			него, по умолчанию - имя таксономии */
			'rewrite' => array(
				/* настройки URL пермалинков */
				'slug' => 'genre', // ярлык
				'hierarchical' => false // разрешить вложенность
			),
		)
	);
}
add_action( 'init', 'add_new_taxonomies', 0 );