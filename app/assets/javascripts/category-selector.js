$(function(){
  // 子カテゴリセレクター、孫カテゴリセレクターの選択肢を動的に定義
  function appendOption(category){
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenSelector(insertHTML){
    let childrenSelector = '';
    childrenSelector = `<div class='category-selector__wrapper--added' id= 'children_wrapper'>
                        <div class='category-selector__wrapper__box'>
                          <select class="select_box" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down category-selector__wrapper__box--arrow-down'></i>
                        </div>
                      </div>`;
    $('#new_product').append(childrenSelector);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    let grandchildrenSelector = '';
    grandchildrenSelector = `<div class='category-selector__wrapper--added' id= 'grandchildren_wrapper'>
                              <div class='category-selector__wrapper__box'>
                                <select class="select-box" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                                <i class='fas fa-chevron-down category-selector__wrapper__box--arrow-down'></i>
                              </div>
                            </div>`;
    $('#new_product').append(grandchildrenSelector);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = $('#parent_category').val(); //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        // 親カテゴリが変更（"---"以外に）されたとき子カテゴリ以下を削除する
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        let insertHTML = '';
        children.forEach(function(child){
          // 選択された親カテゴリ直属の子カテゴリが代入されていく
          insertHTML += appendOption(child);
        });
        appendChidrenSelector(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      //親カテゴリが初期値になった時、子カテゴリ以下を削除する
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.item-detail__category').on('change', '#child_category', function(){
    // 選択された子カテゴリのカスタムデータ属性を取得
    let childId = $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
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
      // 子カテゴリが初期値("---")に戻ったら孫カテゴリを削除する
      $('#grandchildren_wrapper').remove();
    }
  });
});