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
  end

  def toggle_border_navigation
    trigger.on :click do |event|
      toggle_menu
      event.stop_propagation
    end
  end

  def close_on_overlay
    Element.find('.bt-overlay').on :click do |event|
      toggle_menu
      event.stop_propagation
    end
  end
end

navigator = BorderNavigator.new

Document.on 'page:change' do
  navigator.toggle_border_navigation
  navigator.close_on_overlay
end
