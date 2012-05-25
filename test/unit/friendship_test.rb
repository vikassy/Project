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

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
