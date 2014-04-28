class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :phone,        dependent: :destroy, inverse_of: :contact
  has_one :social_media, dependent: :destroy, inverse_of: :contact

  accepts_nested_attributes_for :phone, :social_media

  validate :secondary_email_cannot_be_email

  validates :first_name, presence: true,    length: { maximum: 30 }
  validates :last_name,  allow_blank: true, length: { maximum: 30 }
  validates :company, length: { maximum: 50 }

  validates :email, length: { maximum: 50 }, allow_blank: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :secondary_email, length: { maximum: 50 }, allow_blank: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :notes, length: { maximum: 600 }

  def name
    [first_name, last_name].join(' ')
  end

  private

    def secondary_email_cannot_be_email
      unless email.blank? || secondary_email.blank?
        email_error if email == secondary_email
      end
    end

    def email_error
      errors.add(:email_error, "can't be the same as email")
    end
end
