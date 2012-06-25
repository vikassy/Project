class CreateCalenders < ActiveRecord::Migration
  def change
    create_table :calenders do |t|
      t.integer :user_id
      t.date :date
      t.time :start_time 
      t.time :end_time
      t.timestamps
    end
    add_index :calenders , :date 
    add_index :calenders , :user_id
    add_index :calenders , :start_time
  end
end
