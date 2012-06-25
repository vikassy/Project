class AddTitleToCalenders < ActiveRecord::Migration
  def change
    add_column :calenders, :title, :string
    add_column :calenders, :description , :text
    add_column :calenders, :personal_comment , :text
  end
end
