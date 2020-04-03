class RemoveColumnProducts < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :conditions, :products
    remove_index :conditions, :product_id
    remove_reference :conditions, :product
  end
end