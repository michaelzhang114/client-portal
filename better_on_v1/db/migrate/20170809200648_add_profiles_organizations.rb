class AddProfilesOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :profile_id, :integer
  end
end
