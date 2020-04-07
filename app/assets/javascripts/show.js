$(function(){
  $(".bottom-image").click(function(){
    if($(this).hasClass("bottom-active") == false){
      $(".bottom-images").find(".bottom-active").removeClass("bottom-active");
      $(this).addClass("bottom-active");
      var id = $(this).attr("action");
      $(".top-image").addClass("top-non-active");
      $(`#top-image${id}`).removeClass("top-non-active");
    }
  })
})