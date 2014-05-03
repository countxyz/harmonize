module Features
  module SessionHelpers
    def signup_with(handle, password)
      visit signup_path
      fill_in 'Username', with: handle
      fill_in 'Password', with: password
      click_button 'Create Account'
    end

    def signin
      user = create(:user)
      visit signin_path
      fill_in 'Username', with: user.handle
      fill_in 'Password', with: user.password
      click_button 'Sign In'
    end
  end
end