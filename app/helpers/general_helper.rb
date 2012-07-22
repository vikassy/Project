module GeneralHelper

#This is a general helper for acceptance and invitation of Groups !!

#To check weather one is invited or not 
	def all_invitation_user(id,typ)
		g = Array.new
		if typ == 'g'
			Group.find_each do |f|
				if f.invitation.include?(id)
					g << f
				end
			end
		else
			Event.find_each do |f|
				if f.invitation.include?(id)
					g << f
				end
			end
		end
		return g
	end


#TO check weather user is admin or not !!!
	def is_admin?(id,usr_id,typ)
		if typ  == 'g'
			@grp = Group.find(id)
			return @grp.user_id.include?(usr_id)
		else
			@evnt = Event.find(id)
			return @evnt.admins_id.include?(usr_id)
		end
	end

#Weather is member or has accepted the invitation !!
	def is_member(id,mem_id,typ)
		if typ == 'g'
			return (Group.find(id).accepted.include?(mem_id) or Group.find(id).user_id.include?(mem_id))
		else
			if (Event.find(id).accepted.include?(mem_id) or Event.find(id).admins_id.include?(mem_id))
			 	return (Event.find(id).accepted.include?(mem_id) or Event.find(id).admins_id.include?(mem_id))
			else
				@evnt = Event.find(id)
				if @evnt.accepted and @evnt.accepted[0].class == Array
					@g = @evnt.accepted[0]
					for i in @g
						return is_member(i,mem_id,'g')
					end
				else
					return false
				end
			end
		end
	end

	def find_all_groups 
		@actual = Array.new
		@grps = Group.where(avail: true)
		@grps.each do |f|
			num = Hash.new
			num["id"] = f.id
			num['name'] = f.name
			@actual << num
		end
		return @actual
	end

#Only members of the group || only invities of the group !!

	def only_members(id,typ)
		if typ == 'g'
			@grp = Group.find(id)
			return @grp.accepted
		else
			@evnt = Event.find(id)
			if @evnt.accepted
				if @evnt.accepted[0].class == Array
					return @evnt.accepted[1,@evnt.accepted.length]
				else
					return @evnt.accepted
				end
			else
				return []
			end
		end
	end

#Only admins of the groups or events !!

	def only_admins(id,typ)
		if typ == 'g'
			@grps = Group.find(id)
			return @grps.user_id
		else	
			@evnt = Event.find(id)
			return @evnt.admins_id
		end
	end

#To check weather one has invitation or not !!
	def has_been_invited?(mem_id,typ_id,typ)
		if typ == 'g'
			@grps = Group.find(typ_id)
			return @grps.invitation.include?(mem_id)
		else
			@evnt = Event.find(typ_id)
			return @evnt.invitation.include?(mem_id)
		end
	end

#To find all the members(only members) of a group or event

	def all_members(id,typ)
		if typ == 'g'
			@grps = Group.find(id)
			return @grps.accepted
		else
			@evnt = Event.find(id)
			if @evnt.accepted
				if @evnt.accepted[0].class == Array 
					l = @evnt.accepted.length
					return @evnt.accepted[1,l]
				else
					return @evnt.accepted
				end
			else
				return []
			end
		end
	end

end