class AddSessionToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :session, index: true, foreign_key: true
  end
end
