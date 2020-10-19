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
//		$title = apply_filters( 'widget_title', $instance['title'] );
		$title = $instance['title'];
		$description = $instance['description'];
		$link = $instance['link'];
		$image_link = get_template_directory_uri() . '/assets/images/download.svg';

		echo $args['before_widget'];
		if ( ! empty( $title ) ) {
			echo $args['before_title'] . $title . $args['after_title'];
//			echo $title ;

		}
		if ( ! empty( $description ) ) {
			echo '<p class="description">' . $description . '</p>';
		}
		if ( ! empty( $link ) ) {
			echo '<a class="widget-link" href="' . $link . '"><img class="widget-link-icon" src="'
                 . $image_link . '" alt="">Скачать</a>';
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
		$description = @ $instance['description'] ?: 'Описание';
		$link = @ $instance['link'] ?: 'http://yandex.ru';
		?>
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Заголовок:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php
			echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'description' ); ?>"><?php _e( 'Описание:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'description' ); ?>" name="<?php
			echo $this->get_field_name( 'description' ); ?>" type="text" value="<?php echo esc_attr( $description ); ?>">
		</p>
		<p>
			<label for="<?php echo $this->get_field_id( 'link' ); ?>"><?php _e( 'Ссылка на файл:' ); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id( 'link' ); ?>" name="<?php
			echo $this->get_field_name( 'link' ); ?>" type="text" value="<?php echo esc_attr( $link ); ?>">
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
		$instance['description'] = ( ! empty( $new_instance['description'] ) ) ? strip_tags( $new_instance['description'] ) : '';
		$instance['link'] = ( ! empty( $new_instance['link'] ) ) ? strip_tags( $new_instance['link'] ) : '';
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