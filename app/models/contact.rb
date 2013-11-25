class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { maximum: 30 }
  validates :email,
            length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX }
end
