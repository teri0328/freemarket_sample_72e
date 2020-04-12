crumb :root do
  link "トップページ", root_path
end

crumb :user_show do
  link "マイページ", user_path(User.find(params[:id]))
end

crumb :user_show_like do
  link "いいね一覧", show_like_user_path(User.find(params[:id]))
  parent :user_show
end

crumb :product_new do
  link "出品する", new_product_path
end

crumb :product_show do
  link "商品詳細", product_path(Product.find(params[:id]))
end

crumb :product_show_buy do
  link "購入確認", buy_product_path(Product.find(params[:id]))
  parent :product_show
end

crumb :product_show_pay do
  link "購入完了", pay_product_path(Product.find(params[:id]))
  parent :product_show
end

crumb :card_new do
  link "お支払い方法の登録", new_card_path
end

crumb :card_show do
  link "お支払い方法の確認", card_path(Card.find(params[:id]))
end
