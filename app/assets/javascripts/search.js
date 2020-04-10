$(function(){
  $("#search-input").keyup(function(){
    $.ajax({
      type    : "get",
      dataType: "json",
      url     : "/products/search",
      data    : {keyword : $(this).val()},
      success : function(data){
        var result = $("#search-results")
        result.empty();
        data.forEach(d => {
          // 本番環境ではS3の設定に合わせてimgタグのパスを変更します
          var html = 
          `<a href= "/products/${d.id}">
            <div class = "search-result">${d.name} ${d.category} ${d.bland}
              <div class = "search-result__image">
                <img src = "assets/${d.image}">
              </div>
            </div>
          </a>`;
          result.append(html);
        });
      }
    })
  })
})