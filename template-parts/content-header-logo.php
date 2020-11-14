<?php
// Вывод логотипа
// Получаю ссылку на изображение логотипа
$custom_logo__url = wp_get_attachment_image_src( get_theme_mod( 'custom_logo' ), 'full' );

if(has_custom_logo()){
	if(is_front_page() || is_home()) {
		// Если это главная страница, то логотип сайта выводится, как обычное изображение
		echo '<div class="logo"><img src="' . $custom_logo__url[0] . '" alt="logo">
                      <span class="logo-name-dark">' . get_bloginfo('name') . '</span></div>';
	}
	else {
		// В других случаях изображение логотипа сайта выводится, как ссылка на главную страницу
		echo '<a href="<?php echo get_home_url(); ?>" class="logo"><img src="' . $custom_logo__url[0] . '" alt="logo">
	            <span class="logo-name-light">' . get_bloginfo('name') . '</span></a>';
	}
}
