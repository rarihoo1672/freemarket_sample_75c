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
                <img class="user-thumbnail" src="/assets/adidas.cap-3e39fd851cc3c67bca93be545ce2366e1ace8fdc214047c9eeb58c25b57ba1b6.jpg">
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
                <img class="user-thumbnail" src="/assets/adidas.cap-3e39fd851cc3c67bca93be545ce2366e1ace8fdc214047c9eeb58c25b57ba1b6.jpg">
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
        $(".form-wrap").scroll(function() {
          
      });
      })
      .fail(function (data) {
        alert("エラーが発生したためメッセージは送信できませんでした。")
        $(".form-submit").prop("disabled", false);
      });
  })
})
