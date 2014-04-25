require 'opal-jquery'

Document.ready? do
  Element.find('.notification').effect(:fade_out, 3000)
end
