$(function(){
  $(".brand-area").on("mouseenter", function(){
    $(".brands").removeClass("negative");
    $("p.brand").removeClass("negative");
  });
  $(".brand-area").on("mouseleave", function(){
    $(".brands").addClass("negative");
    $("p.brand").addClass("negative");
  });
});