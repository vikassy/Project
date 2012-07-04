class Group < ActiveRecord::Base
	serialize :user_id , Array
	serialize :accepted , Array
	serialize :invitation , Array
	attr_accessible :name , :description , :avail , :invitation_tokens
	attr_reader :invitation_tokens

	validates :name , presence: true ,
										length: {maximum: 50}
	validates :description , presence: true
	validates :avail , inclusion: {in: [true,false] }

	def invitation_tokens=(ids)
		self.invitation = ids.split(",")
	end

end
