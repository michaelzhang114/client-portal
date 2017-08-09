class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :profile_id
      t.text :highlights
      t.text :feedback
      t.timestamps
    end
  end
end
