<?php
/*
Template Name: Страница контакты
Template Post Type: page
*/
$icon_right_arrow = get_template_directory_uri().'/assets/images/sprite.svg#arrow';
get_header();
?>

	<section class="section-dark">
		<div class="container">
<!--			--><?php //the_title('<h1 class="page-title">', '</h1>', true); ?>
            <span class="page-title">Свяжитесь с нами</span>

            <div class="contacts-wrapper">
                <div class="contact-left">
                    <p class="page-text">Через форму обратной связи</p>
                    <form action="#" class="contacts-form" method="post">
                        <input name="contact_name" type="text" class="input" placeholder="Ваше имя">
                        <input name="contact_email" type="email" class="input" placeholder="Ваш email">
                        <textarea name="contact_comment" name="" id="" class="textarea" placeholder="Ваш вопрос"></textarea>
                        <button type="submit" class="button more">Отправить
                            <svg width="15" height="7" class="icon arrow-icon">
                                <use xlink:href="<?php echo $icon_right_arrow; ?>"></use>
                            </svg>
                        </button>
                    </form>

                </div>
                <div class="contact-right">
                    <p class="page-text">или по этим контактам</p>
                    <div class="contacts-info">
                        <div class="contacts-info-email">hello@forpeople.studio</div>
                        <p class="contacts-info-address">3522 I-75, Business Spur Sault Sainte Marie, MI, 49783</p>
                        <div class="contacts-info-telefon">+2 800 089 45-34</div>
                    </div>
                </div>
            </div>
		</div>
	</section>


<?php
get_footer();
