class AddColumnLikesProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :product, null: false, foreign_key: true
    remove_column :likes, :number, :integer
  end
end
