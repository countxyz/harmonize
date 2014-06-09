module Controllers
  module AuthenticationHelpers

    def sign_in(user)
      session[:user_id] = user.id
    end
  end
end