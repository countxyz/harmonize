require 'opal-jquery'

def trigger
  Element.find('.bt-menu-trigger')
end

def navigation
  Element.find('.bt-menu')
end

def reveal_menu
  navigation.add_class 'bt-menu-open'
end

def first_trigger
  Document.ready? do
    trigger.on :click do |evt|
      reveal_menu
      evt.stop_propagation
    end
  end
end

first_trigger