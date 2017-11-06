class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :heading
      t.text :link
      t.integer :session_id

      t.timestamps null: false
    end
  end
end
