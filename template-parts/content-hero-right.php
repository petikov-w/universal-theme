<?php
    use ru\universal_theme\variables;
?>

<li class="post">
	<?php category_colors(variables::$color_category); ?>
    <a class="post-permalink" href="<?php echo get_the_permalink(); ?>">
        <h2 class="post-title"><?php echo mb_strimwidth(get_the_title(),0,60,'...'); ?></h2>
    </a>
</li>