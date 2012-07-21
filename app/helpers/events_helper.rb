module EventsHelper
	def invitation_evnts(id)
		g = Array.new
		Event.find_each do |f|
			if f.invitation.include?(id)
				g << f
			end
		end
		return g
	end

	def grp_is_invited?(grp_id,evnt_id)
		@evnt = Event.find(evnt_id)
		if @evnt.invitation[0].class == Array and @evnt.invitation[0].include?(grp_id)
			return true
		else
			return false
		end
	end

	def accepted_grp(grp_id,evnt_id)
		@evnt = Event.find(evnt_id)
		@evnt.invitation[0].delete(grp_id)
		if @evnt.accepted[0].class == Array
			@evnt.accepted[0] << grp_id
		else
			@evnt.accepted[0] = [grp_id]
		end
	end

	def accepted_mem(evnt_id,mem_id)		
		@evnt = Event.find(evnt_id)
		if @evnt.invitation.delete(mem_id)
			if @evnt.accepted.nil? or @evnt.accepted.empty? 
				@evnt.accepted = [mem_id]
			else
				@evnt.accepted << mem_id
			end
		end
		@evnt.save
	end

	def is_invited(evnt_id,usr_id)
		return Event.find(evnt_id).invitation.include?(usr_id)	
	end

	def is_member(evnt_id,usr_id)
		return Event.find(evnt_id).accepted.include?(usr_id)
	end
end