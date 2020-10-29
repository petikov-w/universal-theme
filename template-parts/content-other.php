<?php
    $cnt=$_SESSION['count'];
    switch ($cnt) {
    case '1':
?>
    <span class="other-grid-item">
        <a href="<?php echo get_the_permalink() ?>">
            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,23,'...'); ?></div>
            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,88,'...'); ?></div>
        </a>
        <span class="date-post"><?php echo get_the_date('j F') ?></span>
    </span>
	<?php break;

	case '2': ?>
    <span class="other-grid-item">
        <a href="<?php echo get_the_permalink() ?>">
            <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,23,'...'); ?></div>
            <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,88,'...'); ?></div>
        </a>
        <span class="date-post"><?php echo get_the_date('j F') ?></span>
    </span>
	<?php break;

	default: break;
}