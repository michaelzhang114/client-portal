class AddTitleToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :title, :text
  end
end
