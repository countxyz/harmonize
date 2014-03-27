require 'opal-jquery'

class BorderNavigator

  def trigger
    Element.find('.bt-menu-trigger')
  end

  def navigation
    Element.find('.bt-menu')
  end

  def overlay
    Element.find('.bt-overlay')
  end

  def toggle_menu
    navigation.toggle_class 'bt-menu-open'
  end

  def toggle_border_navigation
    trigger.on :click do |event|
      toggle_menu
      event.stop_propagation
    end
  end

  def close_on_overlay
    overlay.on :click do |event|
      toggle_menu
      event.stop_propagation
    end
  end

  def navigate_borders
    Document.on 'page:change' do
      toggle_border_navigation
      close_on_overlay
    end
  end
end

navigator = BorderNavigator.new
navigator.navigate_borders
