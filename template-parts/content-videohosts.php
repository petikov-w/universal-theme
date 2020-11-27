<?php
$src = '';
switch (is_videohosting(get_field('video_link'))) {
	case 'youtube.com':
		$src = 'https://www.youtube.com/embed/';
		break;
	case 'vimeo.com':
		$src = 'https://player.vimeo.com/video/';
		break;
	default:
		echo 'Видеоконтент по указанной ссылке не обнаружен';
}
if ($src!='') {
	echo '<iframe width="70%" height="450" src="' . $src . link_cut(get_field('video_link')) .
	     '" frameborder="0" allowfullscreen></iframe>';
}
