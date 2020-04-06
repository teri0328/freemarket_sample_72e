class RemoveProductIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_reference :categories, :product, foreign_key: true
  end
end
