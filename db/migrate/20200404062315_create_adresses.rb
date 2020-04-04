class CreateAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :adresses do |t|
      t.references :user       , null: false, foreing_key: true
      t.string     :post_number, null: false
      t.integer    :prefecture , null: false
      t.string     :city       , null: false
      t.string     :adress     , null: false
      t.string     :apartment
      t.timestamps
    end
  end
end
