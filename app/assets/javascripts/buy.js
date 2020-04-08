$(function(){
  $("button").click(function(e){
    e.preventDefault();
    Payjp.setPublicKey('pk_test_9c6d063d65d6d71e85f7c006');
    var card = {
      cvc      : $("#cvc").val(),
      number   : $("#number").val(),
      exp_year : $("#exp_year").val(),
      exp_month: $("#exp_month").val()
    };
    Payjp.createToken(card, function(s, response) {
      $("#charge-form").append($("#payjpToken").val(response.id));
      $("#charge-form").get(0).submit();
    });
  })
})