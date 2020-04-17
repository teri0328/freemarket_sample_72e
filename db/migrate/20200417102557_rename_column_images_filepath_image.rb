class RenameColumnImagesFilepathImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :filepath, :image
  end
end
