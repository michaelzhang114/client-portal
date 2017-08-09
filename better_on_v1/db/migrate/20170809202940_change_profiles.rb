class ChangeProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :role
    remove_column :profiles, :organization
  end
end
