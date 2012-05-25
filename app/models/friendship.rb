# == Schema Information
#
# Table name: friendships
#
#  id         :integer         not null, primary key
#  confirm    :boolean
#  sent_req   :boolean
#  user_id    :integer
#  viewer_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Friendship < ActiveRecord::Base

  belongs_to :user
  attr_accessible :confirm ,:sent_req,:user_id,:viewer_id


end
