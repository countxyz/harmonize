module Controllers
  module AuthenticationHelpers

    def signin_authentication
      user = create(:user)
      session[:user_id] = user.id
    end
  end
end