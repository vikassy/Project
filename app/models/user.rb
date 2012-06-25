# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base

  has_many :friendships , dependent: :destroy
  has_many :calenders , dependent: :destroy
  before_save {|user| user.email = email.downcase }
  before_save :create_remember_token  

  attr_accessible :name , :email , :password , :password_confirmation , :terms_of_services  
  has_secure_password
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name  , presence: true , length: {maximum: 50}
  validates :email , format: {with: email_regex },
    		    uniqueness: {case_sensitive: false}
  validates :password , length: {minimum: 6}
  validates :password_confirmation , presence: true 
  validates :terms_of_services , acceptance: true 

private 

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64   
  end
end
