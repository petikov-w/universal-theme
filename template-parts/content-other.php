<?php
    $cnt=$_SESSION['count'];
    switch ($cnt) {
    case '1':
?>
    <li class="other-grid-item2">
        <a href="<?php echo get_the_permalink() ?>">
            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
        </a>
        <div class="date-post"><?php echo get_the_date('j F') ?></div>
    </li>
	<?php break;

	case '2': ?>
    <li class="other-grid-item2">
        <a href="<?php echo get_the_permalink() ?>">
            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
        </a>
        <div class="date-post"><?php echo get_the_date('j F') ?></div>
    </li>
	<?php break;

	default: break;
}