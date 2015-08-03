class RenameImageToContentImage < ActiveRecord::Migration
  def change
    rename_column :contents, :image, :content_image
  end
end
