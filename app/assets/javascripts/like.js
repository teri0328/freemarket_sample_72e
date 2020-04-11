$(function(){
  if($(".like-non-active").length == 0){
    $("#like-btn").find(".fa-heart").removeClass("far");
    $("#like-btn").find(".fa-heart").addClass("fas");
  }
  $("#like-btn").click(function(){
    var likenum  = Number($("#likenum").text());
    if($(".like-non-active").length){
      $(this).removeClass("like-non-active");
      $(this).find(".fa-heart").removeClass("far");
      $(this).find(".fa-heart").addClass("fas");
      $("#likenum").text(likenum+1);
      $.ajax({
        type: "get",
        url : $(this).attr("action_create")
      }).fail(function(){
        alert("エラー")
      })
    }else{
      $(this).addClass("like-non-active");
      $(this).find(".fa-heart").removeClass("fas");
      $(this).find(".fa-heart").addClass("far");
      $("#likenum").text(likenum-1);
      $.ajax({
        type: "delete",
        url : $(this).attr("action_destroy")
      }).fail(function(){
        alert("エラー")
      })
    }
  })
})