class Event < ActiveRecord::Base


	serialize :admins_id
	serialize :invitation
	serialize :accepted
	attr_accessible :name , :description , :venue , :invitation , :member_tokens , :group_tokens , :avail
	attr_reader :group_tokens , :member_tokens  

	validates :name , presence: true 
	validates :description , presence: true

	def group_tokens=(ids)
		arr = Array.new
		arr = ids.split(",").map {|s| s.to_i}
		self.invitation = Array.new
		self.invitation[0] = Array.new
		self.invitation[0] = arr.uniq
	end

	def member_tokens=(ids)
		arr = Array.new
		arr = ids.split(",").map {|s| s.to_i}
			if self.invitation.nil?
				self.invitation = arr.uniq
			else
				arr.uniq.each do |f|
				self.invitation << f
		end
	end
	end


end
