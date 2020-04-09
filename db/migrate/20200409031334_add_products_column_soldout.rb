class AddProductsColumnSoldout < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :soldout, :boolean, null: false, default: false
  end
end
