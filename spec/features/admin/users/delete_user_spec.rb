require 'rails_helper'

feature 'Delete Account' do
  scenario 'delete an account', js: true do
    sign_in_as(create(:admin))
    visit admin_user_path(create(:user))

    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content('User deleted')
    expect(current_path).to eq admin_users_path
  end
end
