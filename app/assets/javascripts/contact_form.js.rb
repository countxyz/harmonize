require 'opal-jquery'

class ContactForm
  def contact_info
    Element.find '#contact-info-panel'
  end

  def phone_book
    Element.find '#phone-book-panel'
  end

  def social_media
    Element.find '#social-media-panel'
  end

  def hide_contact_info
    Element.find('#contact-info-table').hide
  end 

  def hide_phone_book
    Element.find('#phone-book-table').hide
  end

  def hide_social_media
    Element.find('#social-media-table').hide
  end

  def contact_info_edit
    Element.find('#edit-ci-form').effect :fade_in
  end

  def phone_book_edit
    Element.find('#edit-pb-form').effect :fade_in
  end

  def social_media_edit
    Element.find('#edit-sm-form').effect :fade_in
  end

  def contact_info_form
    contact_info.on :click do |event|
      event.prevent_default
      hide_contact_info
      contact_info_edit
    end
  end

  def phone_book_form
    phone_book.on :click do |event|
      event.prevent_default
      hide_phone_book
      phone_book_edit
    end
  end

  def social_media_form
    social_media.on :click do |event|
      event.prevent_default
      hide_social_media
      social_media_edit
    end
  end

  def update_contact
    Document.on 'page:change' do
      contact_info_form
      phone_book_form
      social_media_form
    end
  end
end

contact_updater = ContactForm.new
contact_updater.update_contact
