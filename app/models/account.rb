class Account < ActiveRecord::Base
  include Formatable
  include Nullable
  extend FriendlyId

  belongs_to :user

  has_one :billing_address,  as: :addressable, dependent: :destroy
  has_one :phone,            as: :phoneable,   dependent: :destroy
  has_one :shipping_address, as: :addressable, dependent: :destroy
  has_one :social_media,     as: :sociable,    dependent: :destroy

  has_many :addresses,       as: :addressable, dependent: :destroy
  has_many :emails,          as: :emailable,   dependent: :destroy

  accepts_nested_attributes_for :billing_address,  reject_if: :all_blank
  accepts_nested_attributes_for :emails,           reject_if: :all_blank
  accepts_nested_attributes_for :phone,            reject_if: :all_blank
  accepts_nested_attributes_for :shipping_address, reject_if: :all_blank
  accepts_nested_attributes_for :social_media,     reject_if: :all_blank

  validates_presence_of :name

  validates_length_of :name,    maximum: 50
  validates_length_of :notes,   maximum: 1000, allow_blank: true
  validates_length_of :website, in: 6..50,     allow_blank: true

  friendly_id :name, use: [:slugged, :finders]

  def self.active_total
    where('active is true').count
  end

  def self.inactive_total
    where('active is false').count
  end

  def self.recent_first
    order(created_at: :desc)
  end

  def company_location
    self.billing_address.location
  end
end
