class GroupsController < ApplicationController
	
  include	FriendshipHelper
  include GeneralHelper
  include GroupsHelper
  include EventsHelper


  def index
  	@grps = Group.where(avail: false)
  	@groups = find_all_groups
  end

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

	def show
		@grps = Group.find(params[:id])
		#To check private or not !! (private => true , public => false)
	end

	def update
		@grps = Group.find(params[:id].to_i)
		if @grps.invitation.include?(current_user.id)
			@grps.invitation.delete(current_user.id)
			@grps.accepted << current_user.id
			@grps.save
			redirect_to group_path(params[:id])
		end
	end

	def destroy
		@grps = Group.find(params[:id])
		@grps.invitation.delete(current_user.id)
		@grps.save
		redirect_to overview_path(current_user)
	end
	
	
end