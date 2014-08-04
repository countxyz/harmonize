class Contact < ActiveRecord::Base
  include Formatable
  include Nullable
  include Repeatable
  extend FriendlyId

  friendly_id :contact_name, use: [:slugged, :finders]

  belongs_to :user
  
  has_one :phone,        as: :phoneable, dependent: :destroy
  has_one :social_media, as: :sociable,  dependent: :destroy

  has_many :emails,      as: :emailable, dependent: :destroy

  accepts_nested_attributes_for :emails,           reject_if: :all_blank
  accepts_nested_attributes_for :phone,            reject_if: :all_blank
  accepts_nested_attributes_for :social_media,     reject_if: :all_blank

  validates_presence_of :first_name

  validates_length_of :first_name,       maximum: 30
  validates_length_of :last_name,        maximum: 30
  validates_length_of :company,          maximum: 50,  allow_blank: true
  validates_length_of :notes,            maximum: 600, allow_blank: true

  def self.new_monthly_count
    group_by_month(:created_at).count
  end

  def self.mtd_total
    where('created_at > ?', DateTime.current.beginning_of_month).count
  end

  def self.ytd_total
    where('created_at > ?', DateTime.current.beginning_of_year).count
  end

  def self.first_created_time
    order(created_at: :asc).first.created_at
  end

  def self.most_recent_created_time
    order(created_at: :desc).first.created_at
  end

  def self.recent_first_phone
    recent_first.includes(:phone)
  end

  def contact_name
    [first_name, last_name].join(' ')
  end
end
