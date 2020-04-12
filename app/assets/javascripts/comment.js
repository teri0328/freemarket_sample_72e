$(function(){
  $("#submit-comment").click(function(e){
    e.preventDefault();
    $.ajax({
      type    : "post",
      dataType: "json",
      data    : {comment: $("#comment_comment").val()},
      url     : $(this).attr("action")
    }).done(function(data){
      var html = `
      <div class="detail-wrapper__comments__comment__user">
        <div class="detail-wrapper__comments__comment__user__bubble"></div>
        <div class="detail-wrapper__comments__comment__user__usericon"></div>
        <div class="detail-wrapper__comments__comment__user__username">
          <a href="/users/${data.id}">${data.name}</a>
        </div>
        <div class="detail-wrapper__comments__comment__user__message">
          ${data.comment}
          <div class="detail-wrapper__comments__comment__user__message__days">
            <i class="far fa-clock"></i>
            ${data.time}
            <div class="detail-wrapper__comments__comment__user__message__days__flag">
              <i class="far fa-flag"></i>
            </div>
          </div>
        </div>
      </div>
      `;
      $(".detail-wrapper__comments__comment").append(html);
      $("#submit-comment").prop('disabled', false);
      $("form")[0].reset();
    }).fail(function(){
      alert("エラー");
    })
  })
})