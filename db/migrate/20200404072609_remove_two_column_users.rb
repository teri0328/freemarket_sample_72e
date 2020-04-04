class RemoveTwoColumnUsers < ActiveRecord::Migration[5.0]
  def change
    #住所に関する情報はadressesテーブルに移動
    remove_column :users, :post_number, :string
    remove_column :users, :adress     , :string
  end
end
