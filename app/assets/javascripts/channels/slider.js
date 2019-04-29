$(document).on('turbolinks:load', function() {
  var mySwiper = new Swiper('.top-main-visuals', {
    autoplay: true,
    loop: true,
    navigation: {
      nextEl: '.swiper-button-next', // 次のスライドボタンのセレクタ
      prevEl: '.swiper-button-prev', // 前のスライドボタンのセレクタ
    },
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
    },
    slidesPerView: 1,
    centeredSlides : true_
  });
  return mySwiper
});
