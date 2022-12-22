class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  has_many :favorite_users, through: :favorites, source: :user
end
