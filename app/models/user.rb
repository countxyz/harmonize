class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_uniqueness_of :handle
  validates_uniqueness_of :email, allow_blank: true

  validates_presence_of :handle, :password_digest

  validates_length_of :handle,                 in: 3..20
  validates_length_of :email,                  in: 5..50, allow_blank: true
  validates_length_of :first_name, :last_name, maximum: 30

  validates_format_of :email, with: VALID_EMAIL_REGEX, allow_blank: true
end
