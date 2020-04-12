$(function() {
  // カテゴリー表示領域にマウスポインターが乗った時、すべての第一階層を表示する
  $(".category-area").on("mouseenter", function(){
    $(".gen1s").removeClass("negative");
    $("p.gen1").removeClass("negative");
  });

  // 第一階層にマウスポインターが乗ったときに対応する第二階層だけを表示にする
  $("p.gen1").on("mouseenter", function(){
    let gen1_class = $(this).attr("class");
    gen1_class = gen1_class.replace("gen1", "");
    gen1_class = gen1_class.replace(" gen1", "gen1");
    $(".gen2s").removeClass("negative");
    $("p.gen2").addClass("negative").not(`.${gen1_class}_children`);
    $(`.${gen1_class}_children`).removeClass("negative");
  });

  // 第二階層にマウスポインターが乗ったときに対応する第三階層だけを表示させる
  // $("p.gen2").on("mouseenter", function(){
  //   let gen2_class = $(this).attr("class");
  //   gen2_class = gen2_class.replace("gen2", "");
  //   gen2_class = gen2_class.replace("negative", "");
  //   $(`.${gen2_class}`).removeClass("negative");
  // });

  // カテゴリー表示領域からマウスポインターが離れた時、すべての階層を非表示にする
  $(".category-area").on("mouseleave", function(){
    $("[class^='gen1']").addClass("negative");
    $("[class^='gen2']").addClass("negative");
    $("[class^='gen3']").addClass("negative");
  });
});