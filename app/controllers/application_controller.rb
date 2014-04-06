class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  
  layout :layout_by_controller

  protected

    def layout_by_controller
      devise_controller? ? 'devise' : 'application'
    end
end
