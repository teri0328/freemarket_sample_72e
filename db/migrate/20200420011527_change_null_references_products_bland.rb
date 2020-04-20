class ChangeNullReferencesProductsBland < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :products, :blands
    remove_reference :products, :bland, index: true
    add_reference :products, :bland, foreign_key: true
  end
end
