class User < ActiveRecord::Base
  extend  FriendlyId
  friendly_id :handle, use: [:slugged, :finders]
  
  has_secure_password

  has_many :emails, as: :emailable, dependent: :destroy
  has_many :tasks,                  dependent: :destroy

  validates_uniqueness_of :handle

  validates_presence_of :handle, :password_digest

  validates_length_of :handle,                 in: 3..20
  validates_length_of :first_name, :last_name, maximum: 30
end
