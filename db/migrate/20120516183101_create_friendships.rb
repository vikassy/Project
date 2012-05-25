class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.boolean :confirm
      t.boolean :sent_req
      t.integer :user_id
      t.integer :viewer_id

      t.timestamps
  
    end
    add_index :friendships , :confirm
    add_index :friendships , :sent_req
    add_index :friendships , :user_id
    add_index :friendships , :viewer_id
  end
end
