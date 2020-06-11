$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index) => {
    const html = `
        <div data-index="${index}" class="img-file_group">
          <input class="secret-image img-file" type="file" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image"><br>
          <div class="exhibit__drop-box__previews__preview__delete img-remove">
            削除
          </div>
        <div>`;
    return html;
  }

  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.img-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $("#exhibit__drop-box").on('change', '.img-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#exhibit__drop-box__previews').append(buildImg(targetIndex, blobUrl));
      $("#exhibit__drop-box").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $("#exhibit__drop-box").on('click','.img-remove', function() {
    const targetIndex = $(this).parent().data('index');
    $(`#item_images_attributes_${targetIndex}__destroy`).prop('checked', true);

    $(this).parent().remove();
    $(`#item_images_attributes_${targetIndex}_image`).remove()
    $(`img[data-index="${targetIndex}"]`).remove();

    if($(".img-file").length == 0) $("#exhibit__drop-box").append(buildFileField(fileIndex[0]));
  });
});