<?php
/**
 * Добавление нового виджета Downloader_Widget.
 */
class Socialnetwork_Widget extends WP_Widget {

	// Регистрация виджета используя основной класс
	function __construct() {
		// вызов конструктора выглядит так:
		// __construct( $id_base, $name, $widget_options = array(), $control_options = array() )
		parent::__construct(
			'socialnetwork_widget', // ID виджета, если не указать (оставить ''), то ID будет равен названию класса в нижнем регистре: socialnetwork
			'Социальные сети',
			array( 'description' => 'Наши соцсети', 'classname' => 'widget_socialnetwork',)
		);

		// скрипты/стили виджета, только если он активен
		if ( is_active_widget( false, false, $this->id_base ) || is_customize_preview() ) {
			add_action('wp_enqueue_scripts', array( $this, 'add_socialnetwork_widget_scripts' ));
			add_action('wp_head', array( $this, 'add_socialnetwork_widget_style' ) );
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
		$facebook = $instance['facebook'];
		$instagram = $instance['instagram'];
		$vk = $instance['vk'];
		$twitter = $instance['twitter'];
		$image_facebook = get_template_directory_uri() . '/assets/images/facebook.svg';
		$image_twitter = get_template_directory_uri() . '/assets/images/twitter.svg';
		$image_insagram = get_template_directory_uri() . '/assets/images/insagram.svg';

		echo $args['before_widget'];
		if ( ! empty( $title ) ) {
			echo $args['before_title'] . $title . $args['after_title'];
//			echo $title ;
		}
		if ( ! empty( $facebook ) ) {
			echo '<a class="widget-link" href="' . $facebook . '"><img class="icon-social facebook" src="'. $image_facebook . '""></a>';
		}
		if ( ! empty( $twitter ) ) {
			echo '<a class="widget-link" href="' . $twitter . '"><img class="icon-social twitter" src="'. $image_twitter . '""></a>';
		}
		if ( ! empty( $instagram ) ) {
			echo '<a class="widget-link" href="' . $instagram . '"><img class="icon-social twitter" src="'. $image_twitter . '""></a>';
		}
		if ( ! empty( $vk ) ) {
			echo '<a class="widget-link" href="' . $vk . '"><img class="icon-social twitter" src="'. $image_twitter . '""></a>';
		}

		echo $args['after_widget'];
	}

	/**
	 * Админ-часть виджета
	 *
	 * @param array $instance сохраненные данные из настроек
	 */
	function form( $instance ) {
		$title = @ $instance['title'] ?: 'Заголовок по умолчанию';
		$facebook = @ $instance['facebook'] ?: 'https://www.facebook.com';
        $instagram = @ $instance['instagram'] ?: 'https://www.instagram.com';
        $vk = @ $instance['vk'] ?: 'https://vk.com';
        $twitter = @ $instance['twitter'] ?: 'https://twitter.com';
		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Заголовок:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php
			echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'facebook' ); ?>"><?php _e( 'Facebook:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'facebook' ); ?>" name="<?php
			echo $this->get_field_name( 'facebook' ); ?>" type="text" value="<?php echo esc_attr( $facebook ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'instagram' ); ?>"><?php _e( 'Instagram:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'instagram' ); ?>" name="<?php
			echo $this->get_field_name( 'instagram' ); ?>" type="text" value="<?php echo esc_attr( $instagram ); ?>">
		</p>
        <p>
            <label for="<?php echo $this->get_field_id( 'vk' ); ?>"><?php _e( 'VK:' ); ?></label>
            <input class="widefat" id="<?php echo $this->get_field_id( 'vk' ); ?>" name="<?php
			echo $this->get_field_name( 'vk' ); ?>" type="text" value="<?php echo esc_attr( $vk ); ?>">
        </p>
        <p>
            <label for="<?php echo $this->get_field_id( 'twitter' ); ?>"><?php _e( 'Twitter:' ); ?></label>
            <input class="widefat" id="<?php echo $this->get_field_id( 'twitter' ); ?>" name="<?php
			echo $this->get_field_name( 'twitter' ); ?>" type="text" value="<?php echo esc_attr( $twitter ); ?>">
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
		$instance['facebook'] = ( ! empty( $new_instance['facebook'] ) ) ? strip_tags( $new_instance['facebook'] ) : '';
		$instance['instagram'] = ( ! empty( $new_instance['instagram'] ) ) ? strip_tags( $new_instance['instagram'] ) : '';
		$instance['vk'] = ( ! empty( $new_instance['vk'] ) ) ? strip_tags( $new_instance['vk'] ) : '';
		$instance['twitter'] = ( ! empty( $new_instance['twitter'] ) ) ? strip_tags( $new_instance['twitter'] ) : '';

		return $instance;
	}

	// скрипт виджета
	function add_socialnetwork_widget_scripts() {
		// фильтр чтобы можно было отключить скрипты
		if( ! apply_filters( 'show_my_widget_script', true, $this->id_base ) )
			return;

		$theme_url = get_stylesheet_directory_uri();

		wp_enqueue_script('my_widget_script', $theme_url .'/my_widget_script.js' );
	}

	// стили виджета
	function add_socialnetwork_widget_style() {
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
// конец класса Foo_Widget

// регистрация Foo_Widget в WordPress
function register_socialnetwork_widget() {
	register_widget( 'Socialnetwork_Widget' );
}
add_action( 'widgets_init', 'register_socialnetwork_widget' );