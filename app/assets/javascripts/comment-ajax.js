$(document).on('turbolinks:load', ()=> {
  image = $('#current_user').val();

  function buildHTML(comment) {
    if ( image == "") {
      if ( comment.user_id == comment.exhibitor_id ) {
        let html = `
          <div class="detail-comment-box__inner comment-display">
            <div class="detail-comment-box__inner comment-display__comment-box exhibitor-box">
              <div class="detail-comment-box__inner comment-display__comment-box__name">
                <p class="exhibitor-comment">
                  出品者
                </p>
              </div>
              <div class="detail-comment-box__inner comment-display__comment-box__message">
                <p>
                  ${comment.message}
                </p>
              </div>
            </div>
            <div class="detail-comment-box__inner comment-display__image-box">
              <div class="detail-comment-box__inner comment-display__image-box__exhibitor">
                <img class="user-thumbnail" src="/assets/icon/member_photo_noimage_thumb-3f5db95de8bc1582908f994329d16ed91cf4398c2e3e0cc7387e0f2f8f0c88a9.png">
              </div>
            </div>
          </div>`
        return html;
      } else {
        let html = `
          <div class="detail-comment-box__inner comment-display">
            <div class="detail-comment-box__inner comment-display__comment-box buyer-box">
              <div class="detail-comment-box__inner comment-display__comment-box__name">
                <p class="user-comment">
                  ${ comment.name }
                </p>
              </div>
              <div class="detail-comment-box__inner comment-display__comment-box__message">
                <p>
                  ${ comment.message }
                </p>
              </div>
            </div>
            <div class="detail-comment-box__inner comment-display__image-box">
              <div class="detail-comment-box__inner comment-display__image-box__user">
                <img class="user-thumbnail" src="/assets/icon/member_photo_noimage_thumb-3f5db95de8bc1582908f994329d16ed91cf4398c2e3e0cc7387e0f2f8f0c88a9.png">
              </div>
            </div>
          </div>`
        return html;
      };
    } else {
      if ( comment.user_id == comment.exhibitor_id ) {
        let html = `
          <div class="detail-comment-box__inner comment-display">
            <div class="detail-comment-box__inner comment-display__comment-box exhibitor-box">
              <div class="detail-comment-box__inner comment-display__comment-box__name">
                <p class="exhibitor-comment">
                  出品者
                </p>
              </div>
              <div class="detail-comment-box__inner comment-display__comment-box__message">
                <p>
                  ${comment.message}
                </p>
              </div>
            </div>
            <div class="detail-comment-box__inner comment-display__image-box">
              <div class="detail-comment-box__inner comment-display__image-box__exhibitor">
                <img class="user-thumbnail" src=${image}>
              </div>
            </div>
          </div>`
        return html;
      } else {
        let html = `
          <div class="detail-comment-box__inner comment-display">
            <div class="detail-comment-box__inner comment-display__comment-box buyer-box">
              <div class="detail-comment-box__inner comment-display__comment-box__name">
                <p class="user-comment">
                  ${ comment.name }
                </p>
              </div>
              <div class="detail-comment-box__inner comment-display__comment-box__message">
                <p>
                  ${ comment.message }
                </p>
              </div>
            </div>
            <div class="detail-comment-box__inner comment-display__image-box">
              <div class="detail-comment-box__inner comment-display__image-box__user">
                <img class="user-thumbnail" src=${image}>
              </div>
            </div>
          </div>`
        return html;
      };
    };
  };
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
        $(".form-wrap").animate({ scrollTop: $(".form-wrap")[0].scrollHeight});
      })
      .fail(function (data) {
        alert("エラーが発生したためメッセージは送信できませんでした。")
        $(".form-submit").prop("disabled", false);
      });
  })
})
