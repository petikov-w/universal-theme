<?php
/**
 * Добавление нового виджета Downloader_Widget.
 */
class Posts_In_Current_Category_Widget extends WP_Widget {
// posts_in_current_category_widget
	// Регистрация виджета используя основной класс
	function __construct() {
		// вызов конструктора выглядит так:
		// __construct( $id_base, $name, $widget_options = array(), $control_options = array() )
		parent::__construct(
			'posts_in_current_category_widget',
			__( 'Посты в текущей категории', 'universal' ),
			array( 'description' => __('Посты в текущей категории' , 'universal' ), 'classname' => 'widget-posts-in-current-category',)
		);

		// скрипты/стили виджета, только если он активен
		if ( is_active_widget( false, false, $this->id_base ) || is_customize_preview() ) {
			add_action('wp_enqueue_scripts', array( $this, 'add_posts_in_current_category_widget_scripts' ));
			add_action('wp_head', array( $this, 'add_posts_in_current_category_widget_style' ) );
		}
	}

	/**
	 * Вывод виджета во Фронт-энде
	 *
	 * @param array $args     аргументы виджета.
	 * @param array $instance сохраненные данные из настроек
	 */
	function widget( $args, $instance ) {

		$title = $instance['title'];
		$count = $instance['count'];

		echo $args['before_widget'];
//==============================================================================================
		if ( ! empty( $count ) ) {
			//if ( ! empty( $title ) ) {
				//echo $args['before_title'] . $title . $args['after_title'];
				echo '<div class="widget-posts-in-current-category-wrapper">';
				$args_resent = array(
					'posts_per_page' => $count,
					'category_name' => get_the_category()[0]->slug,
					'post__not_in' => [get_the_ID()],
				);
				cycle_wp_query( $args_resent, 'posts-in-current-category-widget' );
				echo '</div>';
			//}
		}
//----------------------------------------------------------------------------------------------
		echo $args['after_widget'];
	}

	/**
	 * Админ-часть виджета
	 *
	 * @param array $instance сохраненные данные из настроек
	 */
	function form( $instance ) {
		$title = @ $instance['title'] ?: __( 'Заголовок по умолчанию', 'universal' );
		$count = @ $instance['count'] ?: 7;

		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Заголовок:', 'universal'); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php
			echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'count' ); ?>"><?php _e( 'Количество постов:' , 'universal' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'count' ); ?>" name="<?php
			echo $this->get_field_name( 'count' ); ?>" type="text" value="<?php echo esc_attr( $count ); ?>">
		</p>

		<?php
	}

	/**
	 * Сохранение настроек виджета. Здесь данные должны быть очищены и возвращены для сохранения их в базу данных.
	 *
	 * @see WP_Widget::update()
	 *
	 * @param array $new_instance новые настройки
	 * @param array $old_instance предыдущие настройки
	 *
	 * @return array данные которые будут сохранены
	 */
	function update( $new_instance, $old_instance ) {
		$instance = array();
		$instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['count'] = ( ! empty( $new_instance['count'] ) ) ? strip_tags( $new_instance['count'] ) : '';
		//$instance['number']    = (int) $new_instance['number'];
		//$instance['show_date'] = isset( $new_instance['show_date'] ) ? (bool) $new_instance['show_date'] : false;
		return $instance;
	}

	// скрипт виджета
	function add_posts_in_current_category_widget_scripts() {
		// фильтр чтобы можно было отключить скрипты
		if( ! apply_filters( 'show_my_widget_script', true, $this->id_base ) )
			return;

		$theme_url = get_stylesheet_directory_uri();

		wp_enqueue_script('my_widget_script', $theme_url .'/my_widget_script.js' );
	}

	// стили виджета
	function add_posts_in_current_category_widget_style() {
		// фильтр чтобы можно было отключить стили
		if( ! apply_filters( 'show_my_widget_style', true, $this->id_base ) )
			return;
		?>
		<style type="text/css">
            .my_widget a{ display:inline; }
		</style>
		<?php
	}

}
// конец класса Posts_In_Current_Category_Widget

// регистрация Posts_In_Current_Category_Widget в WordPress
function register_posts_in_current_category_widget() {
	register_widget( 'Posts_In_Current_Category_Widget' );
}
add_action( 'widgets_init', 'register_posts_in_current_category_widget' );