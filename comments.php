<?php
/**
 * The template for displaying comments
 *
 * This is the template that displays the area of the page that contains both the current comments
 * and the comment form.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package universal-example
 */

/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */

//=========================================================
// Своя функция для вывода отдельного поста

function universal_theme_comment( $comment, $args, $depth ) {
	// Проверка в каком стиле у нас родитель (ol, ul или div)
	if ( 'div' === $args['style'] ) {
		$tag       = 'div';
		$add_below = 'comment';
	} else {
		$tag       = 'li';
		$add_below = 'div-comment';
	}

	$classes = ' ' . comment_class( empty( $args['has_children'] ) ? '' : 'parent', null, null, false );
	?>

    <<?php echo $tag, $classes; ?> id="comment-<?php comment_ID() ?>">
	<?php if ( 'div' != $args['style'] ) { ?>
        <div id="div-comment-<?php comment_ID() ?>" class="comment-body"><?php
	} ?>
    <div class="comment-author-avatar">
		<?php
		if ( $args['avatar_size'] != 0 ) {
			echo get_avatar( $comment, $args['avatar_size'] );
		}
		?>
    </div>
    <div class="comment-content">
        <div class="comment-author vcard">
			<?php
			printf(
				__( '<cite class="comment-author-name">%s</cite>' ),
				get_comment_author_link()
			);
			?>
            <span class="comment-meta commentmetadata">
		<a href="<?php echo htmlspecialchars( get_comment_link( $comment->comment_ID ) ); ?>">
			<?php
			printf(
				__( '%1$s, %2$s' ),
				get_comment_date('F jS'),
				get_comment_time()
			); ?>
		</a>

		<?php edit_comment_link( __( '(Edit)' ), '  ', '' ); ?>
	</span>


        </div>

		<?php if ( $comment->comment_approved == '0' ) { ?>
            <em class="comment-awaiting-moderation">
				<?php _e( 'Ваш комментарий ожидает модерации.' ); ?>
            </em><br/>
		<?php } ?>

		<?php comment_text(); ?>

        <div class="reply">
            <svg width="14" height="14" class="icon comment-silver-icon">
                <use xlink:href="
                             <?php echo get_template_directory_uri().'/assets/images/sprite-like.svg#comment'?>">
                </use>
            </svg>&nbsp
			<?php
			comment_reply_link(
				array_merge(
					$args,
					array(
						'add_below' => $add_below,
						'depth'     => $depth,
						'max_depth' => $args['max_depth']
					)
				)
			); ?>
        </div>
    </div>


	<?php if ( 'div' != $args['style'] ) { ?>
        </div>
	<?php }
}

//=========================================================





if ( post_password_required() ) {
	return;
}
?>

<div id="comments" class="comments-area">
    <!--    ===============================================================-->
	<?php
	// Проверка на наличие комментариев к посту
	if ( have_comments() ) :
		?>
        <div class="commments-header">
            <h2 class="comments-title">
				<?php echo 'Комментарии  ' . '<span class="comment-count">' . get_comments_number() . '</span>' ?>
            </h2><!-- .comments-title -->
            <a href="#" class="comments-add-button">
                <svg width="18" height="18" class="icon comment-silver-icon">
                    <use xlink:href="
                             <?php echo get_template_directory_uri().'/assets/images/sprite.svg#pencil'?>">
                    </use>
                </svg>&nbsp Добавить комментарий</a>
        </div>

        <!--    ===============================================================-->




		<?php the_comments_navigation(); ?>
        <!--Выводим список комментариев-->
        <ol class="comments-list">
            <!--    Выводим отдельные комментарии-->
			<?php
			wp_list_comments(
				array(
					'style'      => 'ol',
					'short_ping' => true,
					'avatar_size'=> 75,
					'callback' => 'universal_theme_comment',
					'login_text' => 'Зарегистрируйтесь, если хотите прокомментировать'
				)
			);
			$icon_loading = get_template_directory_uri().'/assets/images/sprite.svg#loading';
			?>
        </ol><!-- .comment-list -->
        <a href="#">
            <div class="loading-more">
                <svg width="15" height="15" class="icon loading-icon">
                    <use xlink:href="<?php echo $icon_loading; ?>"></use>
                </svg>
                Загрузить еще
            </div>
        </a>
		<?php
		the_comments_navigation();

		// If comments are closed and there are comments, let's leave a little note, shall we?
		if ( ! comments_open() ) :
			?>
            <p class="no-comments"><?php esc_html_e( 'Comments are closed.', 'universal-example' ); ?></p>
		<?php
		endif;

	endif; // Check for have_comments().
	$icon_arrow = get_template_directory_uri().'/assets/images/sprite.svg#arrow';

	comment_form(
		[
			// переопределим textarea (тело формы)
			'comment_field' => '<div class="comment-form-comment"><label for="comment" class="comment-label">' .
			                   _x( 'Что Вы думаете на этот счет?', 'noun' ) . '</label><br /> 
                                <div class="comment-wrapper">'. get_avatar(get_current_user_id(),75) . '                                                      <div class="comment-textarea-wrapper">
                                   <textarea id="comment" name="comment" aria-required="true" 
                                   class="comment-textarea"></textarea>
                                </div></div></div>',
			'title_reply'          => '',
			'logged_in_as'         => '',
			'class_submit'         => 'comment-submit more-button',
			'label_submit'         => 'Отправить',
			'submit_button'        => '<button name="%1$s" type="submit" id="%2$s" class="%3$s">%4$s
                                    <svg width="15" height="7" class="icon arrow-icon">
                                        <use xlink:href="'. $icon_arrow .'"></use>
                                    </svg>
                                    </button>',
		]
	);
	?>

</div><!-- #comments -->
