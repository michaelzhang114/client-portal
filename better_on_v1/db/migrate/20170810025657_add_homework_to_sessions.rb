class AddHomeworkToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :homework, :text
  end
end
