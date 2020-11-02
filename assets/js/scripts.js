var mySwiper = new Swiper('.swiper-container', {
    // Optional parameters
    loop: true,
    autoplay: { delay: 5000,} ,
    // If we need pagination
    pagination: {
        el: '.swiper-pagination',
    },
})

let menuTuggle = $('.header-menu-toggle');
    menuTuggle.on('click', function (event) {
    event.preventDefault();
    //console.log('Клик по кнопке меню');
        $('.header-nav').slideToggle(200);
})