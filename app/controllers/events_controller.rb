class EventsController < ApplicationController
	
	#include GroupsHelper
	include EventsHelper

	def index 
		@event = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end
		
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		@event.admins_id = Array.new
		@event.accepted = Array.new
		if params[:grp_id]
			@event.admins_id = [params_grp_id.to_i]
		end
		@event.admins_id << current_user.id
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end
	
	def update
		evnt_id = params[:id].to_i
		#Make a note to check weather current_user is admin of group_id
		if params[:grp_id] and is_admin?(params[:grp_id].to_i,current_user.id) and grp_is_invited?(params[:grp_id].to_i,evnt_id)
			accepted_grp(params[:grp_id].to_i)
		else
			accepted_mem(evnt_id,current_user.id)
		end
		redirect_to Event.find(evnt_id)
	end

	
end