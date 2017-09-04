class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.timestamps
      t.integer :profile_id
      t.integer :session_id
    end
  end
end
