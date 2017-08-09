class AddOrganizationIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :organization_id, :integer
  end
end
