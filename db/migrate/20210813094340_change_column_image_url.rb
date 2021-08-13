class ChangeColumnImageUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :image_url, :image_path
  end
end
