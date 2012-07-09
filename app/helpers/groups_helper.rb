module GroupsHelper

	#This notify is used to find out weather user of id is sent an invitation of a group or not  
	def notify(id)
		g = Array.new
		Group.find_each do |f|
		if f.invitation.include?(id)
			g << f
		end
		end
		return g
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
	

end