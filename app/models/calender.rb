class Calender < ActiveRecord::Base
belongs_to :user
attr_accessible :start_time , :end_time , :title , :description , :personal_comment

end
# == Schema Information
#
# Table name: calenders
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  start_time       :time
#  end_time         :time
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  title            :string(255)
#  description      :text
#  personal_comment :text
#

