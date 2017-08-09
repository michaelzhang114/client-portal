class RemoveProfInOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :profile_id
  end
end
