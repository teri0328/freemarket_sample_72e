class ChangeCardsColumnCardId < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :card_id, :integer
    add_column    :cards, :card_id, :string
  end
end
