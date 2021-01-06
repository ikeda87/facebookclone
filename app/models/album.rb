class Album < ApplicationRecord
  before_validation { email.downcase! }
  validates :album, presence: true
  validates :content, presence: true
  validates :user_name, uniqueness: true
  validates :image, presence: true
    validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 55 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5, maximum: 16 }
  format: { with: /\A[a-z\d]{8,16}+\z/i }
  has_many :feeds
end
