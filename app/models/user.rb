class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  #EM_REGEX = /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/
  validates :email, presence: true#, format: { with: EM_REGEX }
  validates :email, uniqueness: true
  has_secure_password
  has_one :member_user
  has_one :group_user
  has_many :messages 
  # has_many :follows
  # has_many :follow_users, through: :follows, source: 'User',foreign_key: 'active_user_id'
 

  has_many :user_follows, class_name: "Follow", foreign_key: :active_user_id
  has_many :follows, through: :user_follows,source: :follow
  has_many :user_followers, class_name: "Follow", foreign_key: :passive_user_id
  has_many :followers, through: :user_followers
end
