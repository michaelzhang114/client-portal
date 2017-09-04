class ChangeCommentType < ActiveRecord::Migration
  def change
    change_column :comments, :info_content, :text
  end
end
