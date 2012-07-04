class AddAcceptedToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :accepted, :text

  end
end
