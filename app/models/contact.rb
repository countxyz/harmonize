class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, length: { maximum: 30 }
end
