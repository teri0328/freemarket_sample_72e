class ChangeColumnEvaluations < ActiveRecord::Migration[5.0]
  def change
    remove_column :evaluations, :name , :string

    add_column :evaluations, :grin  , :integer
    add_column :evaluations, :meh   , :integer
    add_column :evaluations, :frown , :integer
  end
end
