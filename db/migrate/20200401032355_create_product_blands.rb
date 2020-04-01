class CreateProductBlands < ActiveRecord::Migration[5.0]
  def change
    create_table :product_blands do |t|
      t.references :product, null: false, foreign_key: true
      t.references :bland  , null: false, foreign_key: true
      t.timestamps
    end
  end
end
