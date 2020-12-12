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

let contactsForm = $('.contacts-form');
    contactsForm.on ('submit',function (event) {
    event.preventDefault();

    var formData = new FormData(this);
    formData.append('action','contacts_form');
    $.ajax({
        type: "POST",
        url: adminAjax.url,
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            alert('Ответ сервера: '+response);
        }
    });
});


//document.querySelector('.earth').innerHTML += '<div class="card-theme">'+theme+'<h2> \n';

let buttonEarth = $('.earth');
    buttonEarth.on('click', function (event) {
    event.preventDefault();
    //console.log('Клик по кнопке меню');
    console.log('Нажата кнопка "Земля"');
})

// document.querySelector('.earth').onclick = function (){
//     console.log('Нажата кнопка "Земля"');
// };

