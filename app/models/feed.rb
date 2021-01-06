class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :Album
  validates :content, presence: true
end
