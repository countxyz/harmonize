class SocialMedia < ActiveRecord::Base
  belongs_to :contact, inverse_of: :social_media
end
