class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :album
  validates :name, presence: true
  before_validation { email.downcase! }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]*\.[a-z]+\z/i }
  validates :password, presence: true
end
