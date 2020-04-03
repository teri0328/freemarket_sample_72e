class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text       :explanation  , null: false
      t.string     :name         , null: false
      t.string     :region       , null: false
      t.string     :size
      t.integer    :price        , null: false
      t.integer    :shipping_days, null: false
      t.boolean    :postage      , null: false, default: false
      t.references :user         , null: false, foreign_key: true
      t.timestamps
    end
  end
end