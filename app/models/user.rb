class User < ActiveRecord::Base
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :projects
  has_many :tasks

  validates :email, presence: true, uniqueness: true, length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX }
end
