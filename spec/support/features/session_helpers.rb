module Features
  module SessionHelpers

    def signup_with(handle, password)
      visit new_user_path
      fill_in 'Username', with: handle
      fill_in 'Password', with: password
      click_button 'Create Account'
    end

    def sign_in_as!(user)
      visit signin_path
      fill_in 'Username', with: user.handle
      fill_in 'Password', with: user.password
      click_button 'Sign In'
    end
  end
end