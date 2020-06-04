$(function(){
  function buildHTML(comment) {
    if ( comment.user_id == comment.exhibitor_id) {
      let html = `
        <div class="detail-comment-box__inner comment-display">
          <div class="detail-comment-box__inner__name comment-display__name">
            出品者: 
          </div>
          <div class="detail-comment-box__inner__text comment-display__message">
            ${comment.message}
          </div>
        </div>`
      return html;
    } else {
      let html = `
        <div class="detail-comment-box__inner comment-display">
          <div class="detail-comment-box__inner__name comment-display__name">
            ${comment.name}: 
          </div>
          <div class="detail-comment-box__inner__text comment-display__message">
            ${comment.message}
          </div>
        </div>`
      return html;
    }
  }
  $('#new_comment').on('submit', function (e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
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
