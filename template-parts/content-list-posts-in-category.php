<div class="post-card">
	<img src="<?php echo get_the_post_thumbnail_url() ?>" alt="" class="card-thumb">

	<div class="title-pst"><?php echo mb_strimwidth(get_the_title(),0,20,'...'); ?></div>
	<p><?php echo mb_strimwidth(get_the_excerpt(),0,90,'...'); ?></p>
<!-- ======================================================= -->
	<?php $author_id=get_the_author_meta('ID') ?>
	<div class="author2">
		<a href="<?php echo get_author_posts_url($author_id)?>" class="author2">
			<img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar-md">
			<div class="author-bio3">
				<span class="cat-author-name"><?php the_author() ?></span>
				<a href="<?php echo get_the_permalink() ?>">
					<div class="date-comm-like">
						<span class="date-post2"><?php echo get_the_date('j F') ?></span>
						<svg width="14" height="14" class="icon comment-white-icon">
							<use xlink:href="
                                             <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#comment'?>">
							</use>
						</svg>
						<span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>

						<svg width="13" height="12" class="icon comment-white-icon">
							<use xlink:href="
                                             <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#like'?>">
							</use>
						</svg>
						<span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
					</div>
				</a>
			</div>
		</a>
	</div>

<!-- ======================================================= -->


</div>


