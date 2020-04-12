$(function(){
  $("#pick-pagenation").click(function(){
    var used_id = $("#pick-pagenation").attr("action").replace("[", "").replace("]", "").split(",").map(Number);
    $.ajax({
      url:"/",
      type:"get",
      dataType:"json",
      data:""
    }).done(function(data){
      time = 0;
      data.products.forEach(function(product,i){
        if(!used_id.includes(product.id)){
          var productImage = "";
          time ++;
          if(time <= 3){
            used_id.push(product.id);
            data.images.forEach(function(image){
              if(image.product_id == product.id){
                if(productImage == ""){
                  productImage = image.image;
                }
                console.log(image.product_id, product.id, image.image);
              }
            })
            var html =`
            <a data-turbolinks="false" href="/products/${product.id}">
              <div class="pick-image">
                <img alt="QR" src="/assets/${productImage}">
              </div>
              <h3>${product.name}</h3>
              <p1>${product.price}円(税込み)</p1>
            </a>
            `;
            productImage = "";
            $("#pick-list").append(html).hide().fadeIn(500);
          }
        }
      });
      $("#pick-pagenation").attr("action", used_id);
    })
  })
})