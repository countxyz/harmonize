require 'opal-jquery'

class ContactForm
  def hide_social_media
    Element.find('#social-media-table').hide
  end

  def social_media_edit
    Element.find('#edit-sm-form').effect :fade_in
  end

  def social_media
    Element.find '#social-media-panel'
  end

  def social_media_form
    social_media.on :click do |event|
      event.prevent_default
      hide_social_media
      social_media_edit
    end
  end

  def show_form
    Document.on 'page:change' do
      social_media_form
    end
  end
end

social_media = ContactForm.new
social_media.show_form
