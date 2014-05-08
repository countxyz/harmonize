require 'opal-jquery'

Document.on 'page:change' do
  Element.find('.cancel').on :click do |event|
    event.prevent_default
    Element.find('.hidden-form').effect(:slide_up)
  end
end
