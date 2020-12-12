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


// Функция для отладки
function printss($source) {
	echo "<pre style='font-size: 16px; 
                      color: #f52e14;
                      font-weight: 500'>";
	print_r($source);
	echo "</pre>";
}

// Функции для работы с видеохостингами
function link_cut($source) {
	$cuts = [
	        'vimeo.com'   => 'vimeo.com/',
            'youtube.com' => '?v=',
            ];
	$result = false;

	if(is_videohosting($source)!== false) {
	    foreach ($cuts as $s => $v ) {
	        if ($s==is_videohosting($source)) {
	            $result = substr($source,strpos($source, $v)+strlen($v));
            }
        }
    }
	return $result;
}

function is_videohosting($source) {
    $vhosts = [ 'vimeo.com', 'youtube.com', ];
	$result=false;
    foreach ($vhosts as $host){
	    if(strpos($source, $host)!==false){
	        $result = $host;
        }
    }
	return $result;
}

function get_user_role($user_id) {
	$result = '';
	$roles=wp_roles()->roles;
	$current_role = get_the_author_meta('roles', $user_id)[0];

	foreach ($roles as $role => $value) {
		if($role==$current_role) {
			switch ($role) {
                case 'administrator':
                case 'subscriber':
				case 'contributor':
				case 'author':
				case 'editor':
                    $result = translate_user_role($value['name']);
					break;
				default:
					$result = translate_user_role($value['name'], 'universal');
			}
        }
 	}
	return $result;
}

function get_user_role2($user_id) {
	$result = '';
	$roles=wp_roles()->roles;
	$current_role = get_the_author_meta('roles', $user_id)[0];
	foreach ($roles as $role => $value) {
		if($role==$current_role){
			$result = translate_user_role($value['name']);
		}
	}
	return $result;
}

function tag_name_extract($source) {
	$result = '';
	$array_tags = get_terms('post_tag');

	foreach ($array_tags as $tag) {
		if($tag->slug == $source){
			$result = $tag->name;
		}
	}
	return $result;
}



