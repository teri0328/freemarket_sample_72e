class ChangeAdressesToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_table :adresses, :addresses
  end
end
