class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

    def authorize_admin!
      require_signin!

      unless current_user.admin?
        flash[:alert] = "Check ya' self before ya' wreck yo' self; Admins only!"
        redirect_to root_path
      end
    end

    def user_not_authorized
      flash[:error] = 'You are not authorized to perform this action'
      redirect_to(request.referrer || root_path)
    end
end
