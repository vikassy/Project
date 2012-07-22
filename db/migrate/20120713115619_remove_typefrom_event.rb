class RemoveTypefromEvent < ActiveRecord::Migration
	def change
		remove_column :events , :type 
		add_column :events , :avail , :boolean
	end
end
