class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, uniqueness: true, allow_blank: true,
            length: { in: 5..50 }, format: { with: VALID_EMAIL_REGEX }
end
