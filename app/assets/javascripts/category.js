$(function(){
  var category_data;
  $.ajax({
    type    : "get",
    url     : "/",
    dataType: "json"
  }).done(function(data){
    category_data = data;
    category_data.category.forEach(function(d){
      // 子カテゴリ
      if($(`#parent${d.id}`).length != 0){
        $(`#parent${d.id}`).hover(function(){
          $(this).css("color","red");
          category_data.category.forEach(function(d_child){
            if(d_child.ancestry == d.id){
              $(`#child${d_child.id}`).parent().css("background","red");
            }
          })
        },function(){
          $(this).css("color","");
          category_data.category.forEach(function(d_child){
            if(d_child.ancestry == d.id){
              $(`#child${d_child.id}`).parent().css("background","");
            }
          })
        })
      }
      // 孫カテゴリ
      if($(`#child${d.id}`).length != 0){
        $(`#child${d.id}`).hover(function(){
          $(this).css("color","red");
          category_data.category.forEach(function(d_grandchild){
            if(d_grandchild.ancestry != null && d_grandchild.ancestry.indexOf("/") != -1){
              if(d.id == (d_grandchild.ancestry).split("/")[1]){
                $(`#grandchild${d_grandchild.id}`).parent().css("background","red");
              }
            }
          })
        },function(){
          $(this).css("color","");
          category_data.category.forEach(function(d_grandchild){
            if(d_grandchild.ancestry != null && d_grandchild.ancestry.indexOf("/") != -1){
              if(d.id == (d_grandchild.ancestry).split("/")[1]){
                $(this).parent().css("background","");
                $(`#grandchild${d_grandchild.id}`).parent().css("background","");
              }
            }
          })
        })
      }
    })
  })
})