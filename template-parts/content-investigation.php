<section class="investigation" style="background: linear-gradient(0deg,rgba(64,48,61,0.5),rgba(64,48,61,0.5)),
                                                  url(<?php echo get_the_post_thumbnail_url() ?>)
                                                  no-repeat center center">
    <div class="container invest">
        <h2 class="investigation-title"><?php the_title() ?></h2>
        <a href="<?php echo get_the_permalink(); ?>" class="more"><?php echo __( 'Читать статью', 'universal' ) ?><svg width="19" height="15" class="icon arrow-icon">
                <use xlink:href="<?php echo get_template_directory_uri().'/assets/images/sprite.svg#arrow'?>"></use>
            </svg></a>
    </div>
</section>