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

end