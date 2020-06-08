$(document).on("turbolinks:load", function(){
  $('.slick').slick({
    arrows: false,
    fade: true,
    autoplay: true,
    autoplaySpeed: 5000,
    pauseOnHover: true
    
  });
  $('.thumbnail').on('click',function(){
    $('.slick').slick('slickPrev');
  });
  $('.thumbnail').slick({
    asNavFor: '.slick',
    arrows: false,
    swipe: false,
    lazyLoad: 'progressive',
    slidesPerRow: 5,
    rows: 2,
  });
});
