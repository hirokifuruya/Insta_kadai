class Blog < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  mount_uploader :image, ImageUploader
end
