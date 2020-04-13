$(function() {
  // カテゴリー表示領域にマウスポインターが乗った時の処理
  $(".category-area").on("mouseenter", function(){
    $(".gen1s").removeClass("negative");
    $("p.gen1").removeClass("negative");
  });

  // 第一階層にマウスポインターが乗ったときの処理
  $("p.gen1").on("mouseenter", function(){
    $(this).css('background-color', 'red');
    let current_gen1_class = $(this).attr("class");
    current_gen1_class = current_gen1_class.replace("gen1", "");
    current_gen1_class = current_gen1_class.replace(" gen1", "gen1");
    $(".gen2s").removeClass("negative");
    $("p.gen2").addClass("negative").not(`.${current_gen1_class}_children`);
    $(`.${current_gen1_class}_children`).removeClass("negative");
  });
  // 第一階層からマウスポインターが離れたときの処理
  $("p.gen1").on("mouseleave", function(){
    let leaved_gen1_class = $(this).attr("class");
    leaved_gen1_class = leaved_gen1_class.replace("gen1", "");
    leaved_gen1_class = leaved_gen1_class.replace(" gen1", "gen1");
    $(`.${leaved_gen1_class}`).css('background-color', '');
  });

  // 第二階層にマウスポインターが乗ったときの処理
  $("p.gen2").on("mouseenter", function(){
    let gen2_class = $(this).attr("class");
    gen2_class = gen2_class.replace("gen2", "");
    gen2_class = gen2_class.replace("negative", "");

    // マウスポインターが乗ったgen2のクラス名を元にgen1のクラス名を取得
    parent_class = gen2_class.replace("_children", "");
    console.log(`${parent_class}`);
    $(".gen1").css('background-color', '').not(`.${parent_class}`);
    $(`.${parent_class}`).css('background-color', 'red');

  });

  // カテゴリー表示領域からマウスポインターが離れた時、すべての階層を非表示にする
  $(".category-area").on("mouseleave", function(){
    $("[class^='gen1']").addClass("negative");
    $("[class^='gen2']").addClass("negative");
    $("[class^='gen3']").addClass("negative");
  });
});