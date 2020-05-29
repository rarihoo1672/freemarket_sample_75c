$(function(){
  $("#parent-form").on("change",function(){
    let parentValue = document.getElementById("parent-form").value;
    $.ajax({
      url: '/items/search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
    done({
  });
});