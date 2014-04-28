module FormHelper
  def social_media_new contact
    contact.social_media ||= SocialMedia.new
    contact
  end
end
