class ChangeColumnUsers < ActiveRecord::Migration[5.0]
  def change
    #ユーザーの名前と振り仮名を姓名で分ける
    remove_column :users, :name, :string
    remove_column :users, :furigana, :string

    add_column :users, :firstname, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :lastname_kana, :string, null: false
    
    #一意性制約をnicknameから削除し、emailには追加する
    remove_column :users, :email, :string
    remove_column :users, :nickname, :string

    add_column :users, :email, :string, unique: true
    add_column :users, :nickname, :string, null: false

  end
end
