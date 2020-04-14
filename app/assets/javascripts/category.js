$(function(){
  var category_data;
  var child_flag = 0;
  var grandchild_flag = 0;
  $("#category-area").mouseleave(function(){
    child_flag = 0;
    grandchild_flag == 0;
    $(".category-box").css("display","none");
    $(".parent-box").children().css("background","#f5f5f5");
    $(".child-box").children().css("background","#f5f5f5");
  })
  $("#category-hover").hover(function(){
    child_flag = 0;
    grandchild_flag == 0;
    $(".parent-box").css("display","block");
  })
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
          $(".parent-box").children().css("background","#f5f5f5");
          $(".child-box").children().css("background","#f5f5f5");
          $(this).css("background","#69C8CC");
          category_data.category.forEach(function(d_child){
            if($(`#child${d_child.id}`).length != 0){
              $(`#child${d_child.id}`).parent().css("display","none");
              if(d_child.ancestry == d.id){
                $(`#child${d_child.id}`).parent().css("display","block");
              }
            }
          })
        },function(){
          category_data.category.forEach(function(d_child){
            if($(`#child${d_child.id}`).length != 0){
              if(d_child.ancestry == d.id){
                $(".child-box").hover(function(){child_flag = 1;})
                if(child_flag == 0){
                  $(`#parent${d.id}`).css("background","");
                  $(`#child${d_child.id}`).parent().css("display","");
                }
              }
            }
          })
        })
      }
      // 孫カテゴリ
      if($(`#child${d.id}`).length != 0){
        $(`#child${d.id}`).hover(function(){
          $(".child-box").children().css("background","#f5f5f5");
          $(this).css("background","#69C8CC");
          category_data.category.forEach(function(d_grandchild){
            if($(`#grandchild${d_grandchild.id}`).length != 0){
              $(`#grandchild${d_grandchild.id}`).parent().css("display","none");
              if(d_grandchild.ancestry != null && d_grandchild.ancestry.indexOf("/") != -1){
                if(d.id == (d_grandchild.ancestry).split("/")[1]){
                  $(`#grandchild${d_grandchild.id}`).parent().css("display","block");
                }
              }
            }
          })
        },function(){
          category_data.category.forEach(function(d_grandchild){
            if($(`#grandchild${d_grandchild.id}`).length != 0){
              if(d_grandchild.ancestry != null && d_grandchild.ancestry.indexOf("/") != -1){
                if(d.id == (d_grandchild.ancestry).split("/")[1]){
                  $(".grandchild-box").hover(function(){grandchild_flag = 1;})
                  if(grandchild_flag == 0){
                    $(`#child${d.id}`).css("background","");
                    $(`#grandchild${d_grandchild.id}`).parent().css("display","");
                  }
                }
              }
            }
          })
        })
      }
    })
  })
})