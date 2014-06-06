module Features
  module JavascriptHelpers
    
    def confirm_dialog
      page.driver.browser.switch_to.alert.accept
    end
  end
end
