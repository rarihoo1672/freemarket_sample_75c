$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index) => {
    const html = `
      <div data-index="${index}" class="img-file_group">
        <input class="img-file" type="file" name="item[images_attributes][${index}][image]" id=#item_images_attributes_${index}_image"><br>
        <div class="exhibit__drop-box__previews__preview__delete img-remove">
          削除
        </div>
      <div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $("#exhibit__drop-box").on('change', '.img-file', function() {
    $("#exhibit__drop-box").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $("#exhibit__drop-box").on('click','.img-remove', function() {
    $(this).parent().remove()
    if($(".img-file").length == 0) $("#exhibit__drop-box").append(buildFileField(fileIndex[0]));
  });
});