class AddShowToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :show_group, :boolean, default: false
  end
end
