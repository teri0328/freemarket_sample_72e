$(function() {
  // カテゴリー表示領域にポインタが乗った時の処理
  $(".category-area").on("mouseenter", function(){
    $(".gen1s").removeClass("negative");
    $("p.gen1").removeClass("negative");
  });

  // 第一階層にポインタが乗ったときの処理
  $("p.gen1").on("mouseenter", function(){
    // ポインタが乗ったgen1のクラス名を取得し、gen2に転用できるように加工
    let current_gen1_class = $(this).attr("class");
    current_gen1_class = current_gen1_class.replace("gen1", "");
    current_gen1_class = current_gen1_class.replace(" gen1", "gen1");
    // ポインタが乗っているgen1以外のp要素の背景色を削除
    $(".gen1").css('background-color', '').not(`.${current_gen1_class}`);
    // ポインタが乗ったgen1に背景色を追加
    $(this).css('background-color', '#3CCACE');
    // gen2の”箱”を表示
    $(".gen2s").removeClass("negative");
    // ポインタが乗ったgen1直下のgen2以外のgen2を非表示にする
    $(".gen2").addClass("negative").not(`.${current_gen1_class}_children`);
    // ポインタが乗ったgen1直下のgen2を表示
    $(`.${current_gen1_class}_children`).removeClass("negative");
  });
  
  // 第二階層にポインタが乗ったときの処理
  $("p.gen2").on("mouseenter", function(){
    $("a.gen2").removeClass("negative");
    $(".gen2").css('background-color', '');
    $(this).css('background-color', '#3CCACE');
    $("[class^='gen3']").removeClass("negative");
  });

  // カテゴリー表示領域からポインタが離れた時、すべての階層を非表示にする
  $(".category-area").on("mouseleave", function(){
    $("[class^='gen1']").addClass("negative");
    $("[class^='gen2']").addClass("negative");
    $("[class^='gen3']").addClass("negative");
  });
});