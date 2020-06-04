$(document).on("turbolinks:load", function(){
  $("#item_price").keyup(function(){
    let inputPrice = Number($(this).val());
    if(inputPrice >= 300 && inputPrice < 10000000){
      let fee = Math.floor(inputPrice * 0.1);
      let benefit = inputPrice - fee;
      $('#price_fee').text("¥" + fee.toLocaleString()),
      $('#price_benefit').text("¥" + benefit.toLocaleString())
    }else{
      $('#price_fee').text("ー");
      $('#price_benefit').text("ー");
    }
  });
})