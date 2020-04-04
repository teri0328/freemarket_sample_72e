class ChangeColumnAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :prefecture , :integer
    add_column    :addresses, :prefecture , :string
  end
end
