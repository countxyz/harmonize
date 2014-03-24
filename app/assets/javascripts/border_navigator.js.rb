require 'opal-jquery'

class BorderNavigator

  def trigger
    Element.find('.bt-menu-trigger')
  end

  def navigation
    Element.find('.bt-menu')
  end

  def reveal_menu
    navigation.toggle_class 'bt-menu-open'
  end

  def toggle_border_navigation
    Document.ready? do
      trigger.on :click do |event|
        reveal_menu
        event.stop_propagation
      end
    end
  end
end

navigator = BorderNavigator.new
navigator.toggle_border_navigation
