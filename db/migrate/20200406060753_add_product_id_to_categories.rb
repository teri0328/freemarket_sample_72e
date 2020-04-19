class AddProductIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :product, foreign_key: true
  end
end
