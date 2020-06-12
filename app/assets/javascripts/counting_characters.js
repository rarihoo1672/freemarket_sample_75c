$(document).on('turbolinks:load', ()=> {
  $(function(){

    $("#js-counter").keyup(function(){
      let count = $(this).val().length;
      $(".show-count").text(count);
    });
  });
});