require 'opal-jquery'

class ContactForm

  def hide_submit_button
    Element.find('.contact').hide
  end

  def fade_in_phone
    Element.find('.phone_form').effect(:fade_in)
  end

  def find_add_phone
    Element.find('#add_phone')
  end

  def click_add_phone
    find_add_phone.on :click do |click|
      click.prevent_default
      hide_submit_button
      fade_in_phone
    end
  end

  def show_phone_form
    Document.on 'page:change' do
      click_add_phone
    end
  end
end

new_phone = ContactForm.new

new_phone.show_phone_form
