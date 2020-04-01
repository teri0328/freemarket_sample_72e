class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string     :name   , null: false
      t.string     :company, null: false
      t.string     :number , null: false
      t.string     :cord   , null: false
      t.integer    :year   , null: false
      t.integer    :month  , null: false
      t.references :user   , null: false, foreign_key: true
      t.timestamps
    end
  end
end