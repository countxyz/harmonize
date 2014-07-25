class User < ActiveRecord::Base
  extend  FriendlyId
  friendly_id :handle, use: [:slugged, :finders]

  has_secure_password

  has_attached_file :avatar, styles: { thumb: '100x100>', regular: '300x300>' },
                            default_url: '/images/avatar/:style/missing.png'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :emails, as: :emailable, dependent: :destroy
  
  has_many :accounts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :events,   dependent: :destroy
  has_many :tasks,    dependent: :destroy

  validates_uniqueness_of :handle

  validates_presence_of :handle, :password_digest

  validates_length_of :handle,                 in: 3..20
  validates_length_of :first_name, :last_name, maximum: 30

  def formatted_name
    if both_names_empty? then 'N/A'
    else [first_name, last_name].join(' '); end
  end

  def both_names_empty?
    first_name.empty? && last_name.empty?
  end
end
