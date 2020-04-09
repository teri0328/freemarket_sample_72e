class RemoveColumnCardsToken < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :token, :string
  end
end
