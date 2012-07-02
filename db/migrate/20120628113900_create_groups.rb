class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.boolean :avail
      t.text :user_id

      t.timestamps
    end
  end
end
