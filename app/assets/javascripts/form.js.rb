require 'opal-jquery'

class Form

  def cancel_button
    Element.find('.cancel').on :click do |click|
      click.prevent_default
      Element.find('.hidden-form').effect(:slide_up)
    end
  end

  def new_form_hidden(klass)
    Element.find("##{klass}-caret").on :click do |click|
      Element.find("##{klass}-form").toggle_class 'hidden'
      click.stop_propagation
    end
  end

  def form_clicks(klass)
    Document.on 'page:change' do
      new_form_hidden(klass)
      cancel_button
    end
  end
end

arrow   = Form.new
klasses = %w(social-media billing-address shipping-address)
klasses.each { |klass| arrow.form_clicks(klass) }
