class AddInvitationtoEvent < ActiveRecord::Migration
	
	def change
		add_column :events , :invitation , :text
		add_column :events , :accepted , :text
	end

end
