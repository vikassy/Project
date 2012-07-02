class GroupsController < ApplicationController
	
	def new
		@grps = Group.new	
	end

	def create
		@grps = Group.new(params[:group])
		@grps.user_id << current_user.id
		if  @grps.save
			#Sending invitations 
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	
end