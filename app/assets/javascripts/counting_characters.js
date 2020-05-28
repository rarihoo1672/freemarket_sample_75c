$(function(){

  $("#js-counter").keyup(function(){
    var count = $(this).val().length;
    $(".show-count").text(count);
  });
});