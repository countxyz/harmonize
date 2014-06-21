class Account < ActiveRecord::Base
  include Formatable
  include Nullable
  include Sluggable

  belongs_to :user

  has_one :phone,            as: :phoneable,   dependent: :destroy
  has_one :social_media,     as: :sociable,    dependent: :destroy
  has_one :billing_address,  as: :addressable, dependent: :destroy
  has_one :shipping_address, as: :addressable, dependent: :destroy

  has_many :permissions, as: :thing

  scope :viewable_by, ->(user) do
    joins(:permission).where(permissions: { action: 'view', user_id: user.id })
  end

  scope :for, ->(user) do
    user.admin? ? Account.all : Account.viewable_by(user)
  end

  accepts_nested_attributes_for :phone,            reject_if: :all_blank
  accepts_nested_attributes_for :social_media,     reject_if: :all_blank
  accepts_nested_attributes_for :billing_address,  reject_if: :all_blank
  accepts_nested_attributes_for :shipping_address, reject_if: :all_blank

  validates_presence_of :name

  validates_length_of :name,    maximum: 50
  validates_length_of :notes,   maximum: 1000, allow_blank: true
  validates_length_of :email,   in: 5..50,     allow_blank: true
  validates_length_of :website, in: 6..50,     allow_blank: true

  validates_format_of :email,
                      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                      allow_blank: true
end
