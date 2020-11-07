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

function category_colors2 ($colors, $style = 'category-color') {
	foreach($colors as $item => $item_count) {
		if ($item==get_the_category()[0]->slug) {
			$color = $item_count;?>
            <a class=<?php $style ?> href="<?php echo get_category_link(get_the_category()[0]->term_id) ?>"
               style="color:<?= $color; ?>"><?php echo get_the_category()[0]->name  ?></a>
			<?php
		}
	}
}

function printss($source) {
	echo "<pre style='font-size: 20px; 
                      color: #f52e14;
                      font-weight: 500'>";
	print_r($source);
	echo "</pre>";
}