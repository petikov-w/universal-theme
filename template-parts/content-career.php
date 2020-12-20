<?php
use ru\universal_theme\variables;
?>

<div class="career-info">
	<?php category_colors(variables::$color_category); ?>
        <div class="title-p"><?php echo mb_strimwidth(get_the_title(),0,42,'...'); ?></div>
        <p class="text"><?php echo mb_strimwidth(get_the_excerpt(),0,75,'...'); ?></p>

    <a href="<?php echo get_the_permalink(); ?>" class="more"><?php echo __( 'Читать далее', 'universal' ) ?>
        <svg width="19" height="15" class="icon arrow-icon">
            <use xlink:href="<?php echo get_template_directory_uri().'/assets/images/sprite.svg#arrow'?>"></use>
        </svg></a>
</div>


