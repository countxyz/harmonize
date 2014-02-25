class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :phone, dependent: :destroy, inverse_of: :contact
  accepts_nested_attributes_for :phone

  validate :secondary_email_cannot_be_email

  validates :first_name, presence: true, length: { maximum: 30 }

  validates :last_name, presence: true, length: { maximum: 30 }

  validates :company, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX }

  validates :secondary_email, presence: false, length: { maximum: 50 },
            allow_blank: true, format: { with: VALID_EMAIL_REGEX }

  validates :notes, length: { maximum: 600 }

  def name
    [first_name, last_name].join(' ')
  end

  def secondary_email_cannot_be_email
    if email == secondary_email
      errors.add(:secondary_email, "can't be the same as email")
    end
  end
end
