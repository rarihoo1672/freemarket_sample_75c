$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html =`<div data-index="${index}" class="js-file_group">
                  <input class="js-file" type="file"
                  name="product[images_attributes][${index}][src]"
                  id="product_images_attributes_${index}_src"><br>
                  <div class="js-remove">削除</div>
                </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#js').on('change', '.追加画像', function(e){
    $('#画像の範囲？').append(buildFileField(fileIndex[0]));
    fileIndex.shift(); //shift =配列の最初の1つ目を削除して残りの値を返す
    fileIndex.push(fileIndex[fileIndex.length -1] + 1)
  });

  $('#画像の範囲？').om('click', '.削除ボタン', function() {
    $(this).parent().remove();
    if ($('.追加画像').length == 0) $("#画像の範囲？").append(buildFileField(fileIndex[0]));
  });
});
