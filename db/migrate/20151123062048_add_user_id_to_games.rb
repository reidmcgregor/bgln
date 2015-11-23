class AddUserIdToGames < ActiveRecord::Migration
  def change
  	add_column :games, :user_id, :integer
  	add_index :games, :user_id
  	remove_column :games, :owner
  end
end
