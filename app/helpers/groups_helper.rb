module GroupsHelper

	#This notify is used to find out weather user of id is sent an invitation of a group or not  
	def invitation_grps(id)
		g = Array.new
		Group.find_each do |f|
		if f.invitation.include?(id)
			g << f
		end
		end
		return g
	end

	def is_admin?(grp_id,usr_id)
		@grp = Group.find(grp_id)
		return @grp.user_id.include?(usr_id)
	end

	def is_invited_or_member(grp_id,mem_id)
		return (Group.find(grp_id).accepted.include?(mem_id) or Group.find(grp_id).user_id.include?(mem_id))
	end

	def is_member(grp_id,mem_id)
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