class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def require_signin!
      if current_user.nil?
        flash[:error] = 'Sign in required'
        redirect_to signin_url
      end
    end
    helper_method :require_signin!

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def admins_only(&block)
      block.call if current_user.try(:admin?)
    end
    helper_method :admins_only
end
