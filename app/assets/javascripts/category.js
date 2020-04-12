$(function() {
  $(".category-area").on("mouseenter", function(){
    $("p.gen1").removeClass("negative");
  });
  $(".category-container").on("mouseleave", function(){
    $("p.gen1").addClass("negative");
  });
  $("p.gen1").on("mouseenter", function(){
    let gen1_class = $(this).attr("class");
    gen1_class = gen1_class.replace("gen1", "");
    gen1_class = gen1_class.replace(" gen1", "gen1");
    $(`.${gen1_class}_children`).removeClass("negative");
    console.log(`${gen1_class}`);
  });
  $("p.gen1").on("mouseleave", function(){
    let gen1_class = $(this).attr("class");
    gen1_class = gen1_class.replace("gen1", "");
    gen1_class = gen1_class.replace(" gen1", "gen1");
    $(`.${gen1_class}_children`).addClass("negative");
  });
  // $(".category-container").on("mouseleave", function(){
  //   $("p.gen1").addClass("negative");
  //   $("p.gen2").addClass("negative");
  //   $("p.gen3").addClass("negative");
  // });
});

// $(function() {
//   $("p.categories").on("mouseover", function(){
//     $(".negative").removeClass("negative");
//   });
//   $(".gen1s").on("mouseout", function(){
//     $(".gen1s").addClass("negative");
//   });
// });

// $(function() {
//   $(".category").on("mouseover", function(){
//     $(".category").append('<li class = "append_list">appendメソッドで追加した要素です"</li>');
//   });
//   $(".category").on("mouseout", function(){
//     $(".append_list").remove();
//   });
// });