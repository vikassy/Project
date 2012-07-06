class Group < ActiveRecord::Base
	before_save :invitation_tokens
	serialize :user_id , Array
	serialize :accepted , Array
	serialize :invitation , Array
	attr_accessible :name , :description , :avail , :invitation_tokens , :invitation 
	attr_reader :invitation_tokens

	validates :name , presence: true ,
										length: {maximum: 50}
	validates :description , presence: true
	validates :avail , inclusion: {in: [true,false] }

	def invitation_tokens=(ids)
		arr = Array.new
		arr = ids.split(",").map {|s| s.to_i}
		self.invitation = arr.uniq
	end

end
