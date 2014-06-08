class Account < ActiveRecord::Base
  extend FriendlyId

  has_one :phone,            as: :phoneable,   dependent: :destroy
  has_one :social_media,     as: :sociable,    dependent: :destroy
  has_one :billing_address,  as: :addressable, dependent: :destroy
  has_one :shipping_address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :phone,            reject_if: :all_blank
  accepts_nested_attributes_for :social_media,     reject_if: :all_blank
  accepts_nested_attributes_for :billing_address,  reject_if: :all_blank
  accepts_nested_attributes_for :shipping_address, reject_if: :all_blank

  friendly_id :name, use: [:slugged, :finders]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name

  validates_length_of :name,    maximum: 50
  validates_length_of :notes,   maximum: 1000, allow_blank: true
  validates_length_of :email,   in: 5..50,     allow_blank: true
  validates_length_of :website, in: 6..50,     allow_blank: true

  validates_format_of :email, with: VALID_EMAIL_REGEX, allow_blank: true

  def phone
    super || NullPhone.new
  end

  def social_media
    super || NullSocialMedia.new
  end

  def billing_address
    super || NullAddress.new
  end

  def shipping_address
    super || NullAddress.new
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |account|
        csv << account.attributes.values_at(*column_names)
      end
    end
  end
end
