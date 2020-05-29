$(function(){
  function appendOption(category){
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    let childSelectHtml = '';
    childSelectHtml = `<div class='new-container__body__detail-box__category__added' id= 'children_wrapper'>
                        <div class='new-container__body__detail-box__category__select'>
                          <select class="content-form__input" id="child_form" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-angle-down.new-container__body__detail-box__category__select--icon form-select--icon'></i>
                        </div>
                      </div>`;
    $('.new-container__body__detail-box__category').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='new-container__body__detail-box__category__added' id= 'grandchildren_wrapper'>
                              <div class='new-container__body__detail-box__category__select'>
                                <select class="content-form__input" id="grandchild-form" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                <select>
                                <i class='fas fa-angle-down.new-container__body__detail-box__category__select--icon form-select--icon'></i>
                              </div>
                            </div>`;
    $('.new-container__body__detail-box__category').append(grandchildSelectHtml);
  }

  $('#parent-form').on('change', function(){
    let parentCategory = document.getElementById('parent-form').value;
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $('.new-container__body__detail-box__category').on('change', '#child_form', function(){
    let childName = document.getElementById('child_form').value;
    if (childName != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_name: childName },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});