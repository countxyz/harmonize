require 'opal-jquery'

class BorderNavigator

  def trigger
    Element.find('.bt-menu-trigger')
  end

  def navigation
    Element.find('.bt-menu')
  end

  def toggle_menu
    navigation.toggle_class 'bt-menu-open'
    navigation.toggle_class 'bt-menu-close'
  end

  def toggle_border_navigation
    Document.ready? do
      trigger.on :click do |event|
        toggle_menu
        event.stop_propagation
      end
    end
  end

  def close_on_overlay
    Document.ready? do
      Element.find('.bt-overlay').on :click do |event|
        toggle_menu
        event.stop_propagation
      end
    end
  end
end

navigator = BorderNavigator.new
navigator.toggle_border_navigation
navigator.close_on_overlay
