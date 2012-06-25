class RemoveDateFromCalender < ActiveRecord::Migration
  def up
    remove_column :calenders, :date
      end

  def down
    add_column :calenders, :date, :date
  end
end
