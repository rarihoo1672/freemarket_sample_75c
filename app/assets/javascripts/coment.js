$(function(){
  function buildHTML(comment) {
    if ( comment.user_id == comment.exhibitor_id) {
      var html = `
        <div class="detail-comment-box__inner">
          <div class="detail-comment-box__inner__name">
            出品者: 
          </div>
          <div class="detail-comment-box__inner__text">
            ${comment.message}
          </div>
        </div>`
      return html;
    } else {
      var html = `
        <div class="detail-comment-box__inner">
          <div class="detail-comment-box__inner__name">
            ${comment.name}: 
          </div>
          <div class="detail-comment-box__inner__text">
            ${comment.message}
          </div>
        </div>`
      return html;
    }
  }
  $('#new_comment').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done(function (data) {
        let html = buildHTML(data);
        $('.form-wrap').append(html);
        $("#form-input").val("");
        $('.form-submit').prop('disabled', false);
      })
      .fail(function (data) {
        alert("エラーが発生したためメッセージは送信できませんでした。")
        $(".form-submit").prop("disabled", false);
      });
  })
})
