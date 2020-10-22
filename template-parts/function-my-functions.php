<?php

//========================================================
//=================== Мои функции ========================
//========================================================

// Функция меняющая цвет рубрики в зависимости от её названия
function category_colors ($colors) {
	foreach($colors as $item => $item_count) {
		if ($item==get_the_category()[0]->slug) {
			$color = $item_count;?>
            <a class="category-color" href="<?php echo get_category_link(get_the_category()[0]->term_id) ?>"
			   style="color:<?= $color; ?>"><?php echo get_the_category()[0]->name  ?></a>
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