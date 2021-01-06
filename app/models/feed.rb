class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :album
  validates :content, presence: true
  validates :content, presence: true
end
