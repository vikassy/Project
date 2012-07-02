class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :groups, :gavatar, :string

  end
end
