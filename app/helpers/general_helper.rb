module GeneralHelper

	def invitation_gen(id,typ)
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

	def is_admin?(id,usr_id,typ)
		if typ  == 'g'
			@grp = Group.find(id)
			return @grp.user_id.include?(usr_id)
		else
			@evnt = Event.find(id)
			return @evnt.admins_id.include?(usr_id)
		end
	end

	def is_invited_or_member(id,mem_id,typ)
		if typ == 'g'
			return (Group.find(id).accepted.include?(mem_id) or Group.find(id).user_id.include?(mem_id))
		else
			return (Event.find(id).accepted.include?(mem_id) or Event.find(id).admins_id.include?(mem_id)
		end
	end

	def is_member(id,mem_id,typ)
		return Group.find(grp_id).accepted.include?(mem_id)
	end 

	def is_invited(grp_id,mem_id)
		return Group.find(grp_id).invitation.include?(mem_id)
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


end