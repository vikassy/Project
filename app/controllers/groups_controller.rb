class GroupsController < ApplicationController
	
  include	FriendshipHelper

	def new
		@users = User.all
		@grps = Group.new	
		respond_to do |format|
			format.html
			#format.json {render 'genpars/friends.json'}
		end
	end

	def create
		@grps = Group.new(params[:group])
		@grps.user_id << current_user.id
		if @grps.save
			#Sending invitations 
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	
end