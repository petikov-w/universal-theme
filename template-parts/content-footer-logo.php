<?php
//Вывод логотипа
// Получаю ссылку на изображение логотипа
$custom_logo__url = wp_get_attachment_image_src( get_theme_mod( 'custom_logo' ), 'full' );
if(has_custom_logo()){
	if(is_front_page()) {
		// Если это главная страница, то логотип сайта выводится, как обычное изображение
		echo '<div class="logo-footer"><img src="' . $custom_logo__url[0] . '" alt="logo"></div>';
	}
	else {
		// В других случаях изображение логотипа сайта выводится, как ссылка на главную страницу
		echo '<a href="/" class="logo-footer"><img src="' . $custom_logo__url[0] . '" alt="logo"></a>';
	}
}
