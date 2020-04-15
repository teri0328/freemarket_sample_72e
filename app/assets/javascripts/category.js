$(function() {
  // カテゴリー表示領域にポインタが乗った時の処理
  $(".category-area").on("mouseenter", function(){
    $(".gen1s").removeClass("negative");
    $("p.gen1").removeClass("negative");
  });

  // 第一階層にポインタが乗ったときの処理
  $("p.gen1").on("mouseenter", function(){
    // ポインタが乗ったgen1のid名を取得
    let current_gen1_id = $(this).attr("id");
    // ポインタが乗っているgen1以外の背景色を削除
    $(".gen1").css('background-color', '').not(`#${current_gen1_id}`);
    // ポインタが乗ったgen1に背景色を追加
    $(this).css('background-color', '#3CCACE');
    // gen2の”箱”を表示
    $(".gen2s").removeClass("negative");
    // ポインタが乗ったgen1直下のgen2以外のgen2を非表示にする
    $(".gen2").addClass("negative").not(`.${current_gen1_id}`);
    // ポインタが乗ったgen1直下のgen2を表示
    $(`.${current_gen1_id}`).removeClass("negative");
  });

  // 第二階層にポインタが乗ったときの処理
  $("p.gen2").on("mouseenter", function(){
    // ポインタが乗ったgen2のid名(gen2.id)を取得
    let current_gen2_id = $(this).attr("id");
    // ポインタが乗ったgen2のクラス名（=> gen2.ancestry => gen1.id)を取得、加工
    let current_gen2_class = $(this).attr("class");
    current_gen2_class = current_gen2_class.replace("gen2", "");
    current_gen2_class = current_gen2_class.replace(` `, ``);
    // ポインタが乗っているgen2以外の背景色を削除
    $(".gen2").css('background-color', '').not(`#${current_gen2_id}`);
    // ポインタが乗ったgen2に背景色を追加
    $(this).css('background-color', '#3CCACE');

    // gen3に対する処理
    $(".gen3s").removeClass("negative");
    let parent_id = current_gen2_class
    let child_id = current_gen2_id
    $(".gen3").addClass("negative");
    $(`.${parent_id}.${child_id}`).removeClass("negative");
  });
  $(".gen3s").on("mouseleave", function(){
    $(this).addClass("negative");
  });

  $(".gen3").on("mouseenter", function(){
    $(this).css('background-color', '#3CCACE');
    // $(this).removeClass("negative");
  });

  $(".gen3").on("mouseleave", function(){
    let leaved_gen3_class = $(this).attr("class");
    leaved_gen3_class = leaved_gen3_class.replace("gen3", "");
    $(this).css('background-color', '');
    $(`.${leaved_gen3_class}`).removeClass("negative");

  });

  // カテゴリー表示領域からポインタが離れた時、すべての階層を非表示にする
  $(".category-area").on("mouseleave", function(){
    $("[class^='gen1']").addClass("negative");
    $("[class^='gen2']").addClass("negative");
    $("[class^='gen3']").addClass("negative");
  });

});