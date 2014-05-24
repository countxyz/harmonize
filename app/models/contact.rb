class Contact < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  has_one :phone,        dependent: :destroy, inverse_of: :contact
  has_one :social_media, dependent: :destroy, inverse_of: :contact

  accepts_nested_attributes_for :phone, :social_media

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validate :secondary_email_cannot_be_email

  validates :first_name, presence: true, length: { maximum: 30 }

  validates :last_name, length: { maximum: 30 }, allow_blank: true

  validates :company, length: { in: 2..50 }, allow_blank: true

  validates :email, length: { in: 5..50 }, allow_blank: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :secondary_email, length: { in: 5..50 }, allow_blank: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :notes, length: { in: 2..600 }, allow_blank: true

  def name
    [first_name, last_name].join(' ')
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
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
