// $(function() {
//   $(".bland").on("mouseover", function(){
//     $(".negative").removeClass("negative");
//   });
//   $(".bland").on("mouseout", function(){
//     $(".category-box").addClass("negative");
//   });
// });

$(function() {
  $(".category").on("mouseover", function(){
    $(".category").append('<li class = "append_list">appendメソッドで追加した要素です"</li>');
  });
  $(".category").on("mouseout", function(){
    $(".append_list").remove();
  });
});