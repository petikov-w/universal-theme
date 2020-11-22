<?php
/*
Template Name: Страница контакты
Template Post Type: page
*/

get_header();
?>

	<section class="section-dark">
		<div class="container">
<!--			--><?php //the_title('<h1 class="page-title">', '</h1>', true); ?>
            <span class="page-title">Свяжитесь с нами</span>

            <div class="contacts-wrapper">
                <div class="contact-left">
                    <p class="page-text">Через форму обратной связи</p>
                    <form action="#" class="contacts-form">
                        <input type="text" class="input contacts-input">

                    </form>

                </div>
                <div class="contact-right">
                    <p class="page-text">или по этим контактам</p>
                </div>
            </div>
		</div>
	</section>


<?php
get_footer();
