class GroupUser < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :gender, presence: true
  validates :prefectures, presence: true
  validates :part, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :url, presence: true
  validates :description, presence: true
  #validates :url, presence: true
  
  
  mount_uploader :image, ImageUploader
  belongs_to :user
end
