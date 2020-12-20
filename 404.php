<?php
get_header();
?>
	<div class="container">
		<div class="page-404">
			<span class="i-404">404</span>
			<span class="e-404"><?php _e('Ошибка!', 'univresal') ?></span>
			<p class="e-message"><?php _e('Страница не найдена. Видимо она не существует, либо указана неверная ссылка.', 'univresal') ?></p>
			<a href="<?php echo get_home_url(); ?>" class="button-404">
				<?php _e('Вернуться на главную', 'universal'); ?>
			</a>
		</div>

	</div>

<?php
get_footer();



