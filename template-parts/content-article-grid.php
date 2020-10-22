<?php
		$cnt=$_SESSION['count'];
		$tag_filters = $_SESSION['filter'];
		$author_id=get_the_author_meta('ID');
		switch ($cnt) {
			case '1':
?>
<!--  --------------------------- 1 --------------------------------------->
            <li class="article-grid-item article-gri-01">
                <div class="top-blc-01">

                    <a href="<?php echo get_the_permalink() ?>">
                        <div class="left-blc">
                            <span class="category-info2"><?php echo get_the_category()[0]->name ?></span>
                            <span class="article-title-3"><p><?php the_title() ?></p> </span>
                            <div class="exp-txt2"><?php echo mb_strimwidth(get_the_excerpt(),0,200,'...'); ?></div>
                        </div>
                    </a>

                </div>
                <div class="bottom-blc-top-line"></div>
                <div class="bottom-blc">
                    <a href="<?php echo get_author_posts_url($author_id)?>" >
                    <div class="author-blc">
                                <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar3">
                                <span class="author-name3"><?php the_author() ?></span>
                                <span class="author-desc"><?php echo mb_strimwidth(get_the_author_meta('description'),0,40,'...'); ?></span>
                                <img class="icon-comment" src="<?php echo get_template_directory_uri().'/assets/images/comment-silver.svg' ?>" alt="">
                                <span class="comments-counter"><?php comments_number('0','1','%'); ?></span>
                    </div>
                    </a>
                </div>
            </li>
<!--  --------------------------- 1 статья (конец блока) ------------------>
        <?php break;

        case '2': ?>
<!--  ---------------------------- 2 статья-------------------------------->
           <li class="article-grid-item article-gri-02 csm">
               <img class="img-cs2" src="<?php echo get_the_post_thumbnail_url()?>" alt="">
               <div class="sss">

                       <div class="top-blc">
                           <a href="<?php echo get_the_permalink() ?>">
                           <span class="tag-info"><?php echo $tag_filters ?></span>
                           </a>
                       </div>

                   <a href="<?php echo get_the_permalink() ?>">
                   <div class="bottom-blc2">
                       <span class="category-info"><?php echo get_the_category()[0]->name ?></span>
                       <span class="article-title-2"><p><?php the_title() ?></p></span>

                       <?php $author_id=get_the_author_meta('ID') ?>
                       <div class="author2">
                           <a href="<?php echo get_author_posts_url($author_id)?>" class="author2">
                               <img src="<?php echo get_avatar_url($author_id)?>" alt="" class="avatar2">
                               <div class="author-bio2">
                                   <span class="author-name2"><?php the_author() ?></span>
                                   <a href="<?php echo get_the_permalink() ?>">
                                   <div class="date-comm-like">
                                       <span class="date-post2"><?php echo get_the_date('j F') ?></span>
                                       <img class="comment" src="<?php echo get_template_directory_uri().'/assets/images/comment-white.svg' ?>" alt="">
                                       <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                                       <img class="like" src="<?php echo get_template_directory_uri().'/assets/images/heart-white.svg' ?>" alt="">
                                       <span class="comments-counter2"><?php comments_number('0','1','%'); ?></span>
                                   </div>
                                   </a>
                               </div>
                           </a>
                       </div>
                   </div>
                   </a>
               </div>
           </li>
<!--  ---------------------------- 2 статья (конец блока) ----------------->
       <?php break;

       case '3': ?>
<!--  ---------------------------- 3 статья-------------------------------->
	        <li class="article-grid-item article-gri-04 csm">
	            <a href="<?php echo get_the_permalink() ?>">
	                <img class="img-cs3" src="<?php echo get_the_post_thumbnail_url()?>" alt="">
	                <span class="cs3"><p><?php echo mb_strimwidth(get_the_title(),0,44,'...'); ?></p></span>
	            </a>
	        </li>
<!--  ----------------------------- 3 статья (конец блока) ---------------->
       <?php break;

	   case '4': ?>
<!--  ---------------------------- 4 статья-------------------------------->
        <li class="article-grid-item">
            <a href="<?php echo get_the_permalink() ?>">
                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
            </a>
            <div class="date-post"><?php echo get_the_date('j F') ?></div>
        </li>
<!--  ---------------------------- 4 статья (конец блока)------------------>
	    <?php break;

        case '5': ?>
<!--  ---------------------------- 5 статья-------------------------------->
        <li class="article-grid-item">
            <a href="<?php echo get_the_permalink() ?>">
                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
            </a>
                <div class="date-post"><?php echo get_the_date('j F') ?></div>
        </li>
<!--   ---------------------------- 5 статья (конец блока) ----------------->
	    <?php break;

        case '6': ?>
<!--   ---------------------------- 6 статья ------------------------------->
        <li class="article-grid-item">
            <a href="<?php echo get_the_permalink() ?>">
                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
            </a>
            <div class="date-post"><?php echo get_the_date('j F') ?></div>
        </li>
<!--   --------------------------- 6 статья (конец блока) ------------------>
	    <?php break;

        case '7': ?>
<!--   ---------------------------- 7 статья ------------------------------->
        <li class="article-grid-item">
            <a href="<?php echo get_the_permalink() ?>">
                <div class="cs3"><?php echo mb_strimwidth(get_the_title(),0,22,'...'); ?></div>
                <div class="exp-txt"><?php echo mb_strimwidth(get_the_excerpt(),0,80,'...'); ?></div>
            </a>
            <div class="date-post"><?php echo get_the_date('j F') ?></div>
        </li>
<!--   ---------------------------- 7 статья (конец блока) ----------------->
	    <?php break;

	    default: break;
}