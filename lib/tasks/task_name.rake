namespace :task_name do
  desc "実行処理の説明"
  task :create, ['name'] => :environment do |task|
    product = Product.new(explanation: "商品説明文です", name: "商品名", region: "東京都", size: "サイズ", price: 1000, shipping_days: 1, postage: true, user_id: 3, condition_id: 1, category_id: 1, bland_id: 1, shipping_method: "郵送")
    product.save!
  end
end