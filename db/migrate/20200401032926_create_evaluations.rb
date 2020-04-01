class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.string     :name   , null: false
      t.references :user   , null: false , foreign_key: true
      t.references :product, null: false , foreign_key: true
      t.timestamps
    end
  end
end
