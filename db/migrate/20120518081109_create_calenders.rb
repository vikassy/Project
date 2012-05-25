class CreateCalenders < ActiveRecord::Migration
  def change
    create_table :calenders do |t|

      t.timestamps
    end
  end
end
