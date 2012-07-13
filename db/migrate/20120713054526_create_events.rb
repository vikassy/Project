class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :type
      t.text :admins_id
      t.text :venue

      t.timestamps
    end
  end
end
