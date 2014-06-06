class Contact < ActiveRecord::Base
  extend FriendlyId
  
  has_one :phone,        as: :phoneable, dependent: :destroy
  has_one :social_media, as: :sociable,  dependent: :destroy

  accepts_nested_attributes_for :phone, :social_media, reject_if: :all_blank

  friendly_id :name, use: [:slugged, :finders]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validate :secondary_email_cannot_be_email

  validates_presence_of :first_name

  validates_length_of :first_name,       maximum: 30
  validates_length_of :last_name,        maximum: 30,  allow_blank: true
  validates_length_of :company,          maximum: 50,  allow_blank: true
  validates_length_of :notes,            maximum: 600, allow_blank: true
  validates_length_of :email,            in: 5..30,    allow_blank: true
  validates_length_of :secondary_email,  in: 5..30,    allow_blank: true

  validates_format_of :email, :secondary_email, with: VALID_EMAIL_REGEX,
                      allow_blank: true

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
