class RenameColumnImagesImageImageUrl < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :image, :filepath
    add_column :images, :image, :string
  end
end
