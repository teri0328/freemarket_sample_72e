class AddColumnProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :condition, null: false, foreign_key: true
    add_reference :products, :category , null: false, foreign_key: true
    add_reference :products, :bland    , null: false, foreign_key: true
  end
end
