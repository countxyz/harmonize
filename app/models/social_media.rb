class SocialMedia < ActiveRecord::Base
  belongs_to :sociable, polymorphic: true

  validates_length_of :google_plus, :github, :twitter, :skype, :coderwall,
                      :linkedin, :facebook, maximum: 30, allow_blank: true
end
