$(function(){
    // カテゴリセレクターの選択肢を動的に定義
    function appendOption(category,selected){
      let html = `<option value="${category.id}" ${selected}>${category.name}</option>`;
      return html;
    }
  // 親カテゴリーの表示作成
  function appendParentSelector(insertHTML){
    let parentSelector = '';
    parentSelector = `<div class='category-selector__wrapper' id= 'parent_wrapper'>
                        <div class='category-selector__wrapper__box'>
                          <select class="select_box" id="parent_category" name="test">
                            <option value="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.item-detail__category__form').append(parentSelector);
  }
  // 子カテゴリーの表示作成
  function appendChidrenSelector(insertHTML){
    let childrenSelector = '';
    childrenSelector = `<div class='category-selector__wrapper--added' id= 'children_wrapper'>
                        <div class='category-selector__wrapper__box'>
                          <select class="select_box" id="child_category" name="test">
                            <option value="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.item-detail__category__form').append(childrenSelector);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    let grandchildrenSelector = '';
    grandchildrenSelector = `<div class='category-selector__wrapper--added' id= 'grandchildren_wrapper'>
                              <div class='category-selector__wrapper__box'>
                                <select class="select_box" id="grandchild_category" name="test">
                                  <option value="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.item-detail__category__form').append(grandchildrenSelector);
  }
  // editアクションの場合のみ、カテゴリセレクターを生成する
  var request = $("#parent_wrapper").attr("action");
  if(request != undefined && request.indexOf("edit") != -1){
    console.log("ここからカテゴリセレクタを生成");
    $.ajax({
      url: 'get_category_parent',
      type:'GET'
    }).done(function(data){
      console.log(data.parent.id, data.child.id, data.grandchild.id);
      let insert = '';
      data.parents.forEach(function(parent){
        if(data.parent.id == parent.id){
          console.log(`this${parent.name}`);
        }
        console.log(parent.name);
      })
      insert = '';
      data.children.forEach(function(child){
        if(data.child.id == child.id){
          console.log(`this${child.name}`);
        }
        console.log(child.name);
      })
      insert = '';
      data.grandchildren.forEach(function(grandchild){
        if(data.grandchild.id == grandchild.id){
          console.log(`this${grandchild.name}`);
        }
        console.log(grandchild.name);
      })
      if(data.child == null && data.grandchild == null){
        console.log(data.parent.id);
      }else if(data.grandchild == null){
        console.log(data.parent.id);
        console.log(data.child.id);
      }else{
        console.log(data.parent.id);
        console.log(data.child.id);
        console.log(data.grandchild.id);
      }
    })
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    // 選択された親カテゴリの”表示されている文字”を取得
    let parentCategory = $('#parent_category option:selected').text();
    if (parentCategory != "---"){
      $('#parent_category').attr("name", 'product[category_id]')
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
          insertHTML += appendOption(child,"");
        });
        appendChidrenSelector(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#parent_category').attr("name", 'test')
      //親カテゴリが初期値になった時、子カテゴリ以下を削除する
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.item-detail__category').on('change', '#child_category', function(){
    // 選択された子カテゴリのvalue属性(= レコードのid)を取得
    let childId = $('#child_category option:selected').val();
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
            insertHTML += appendOption(grandchild,"");
          });
          appendGrandchidrenBox(insertHTML);
          $('#child_category').attr("name", 'product[category_id]')
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').attr("name", 'test')
      // 子カテゴリが初期値("---")に戻ったら孫カテゴリを削除する
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.item-detail__category').on('change', '#grandchild_category', function(){
    let grandchildId = $('#grandchild_category option:selected').val();
    if (grandchildId != "---"){
      $('#grandchild_category').attr("name", 'product[category_id]')
    }else{
      $('#grandchild_category').attr("name", 'test')
    }
  });
});