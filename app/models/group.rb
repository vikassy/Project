class Group < ActiveRecord::Base
	serialize :user_id , Array
	attr_accessible :name , :description , :avail

	validates :name , presence: true ,
										length: {maximum: 50}
	validates :description , presence: true
	validates :avail , presence: true
	


end
