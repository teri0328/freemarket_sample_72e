class RemoveColumnUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :encrypted_password,    :string
    add_column    :users, :password,              :string
    add_column    :users, :password_confirmation, :string
  end
end