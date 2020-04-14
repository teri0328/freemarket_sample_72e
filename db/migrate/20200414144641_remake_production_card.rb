class RemakeProductionCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :customer_id, :string
    remove_column :cards, :name, :string
    remove_column :cards, :company, :string
    remove_column :cards, :number, :string
    remove_column :cards, :cord, :string
    remove_column :cards, :year, :integer
    remove_column :cards, :month, :integer
  end
end
