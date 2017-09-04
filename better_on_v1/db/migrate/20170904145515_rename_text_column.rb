class RenameTextColumn < ActiveRecord::Migration
  def change
    rename_column :comments, :text, :info_content
  end
end
