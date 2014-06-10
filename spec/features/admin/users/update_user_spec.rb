require 'rails_helper'

feature 'Update User' do
  before do
    sign_in_as(create(:admin))
    visit edit_admin_user_path(create(:user))
  end

  scenario 'update user', js: true do
    fill_in 'First Name', with: 'Art'

    click_on 'Update User'
    expect(page).to have_content('User updated')
  end

  scenario 'cannot update account with invalid attributes', js: true do
    fill_in 'Username', with: ''

    click_on 'Update User'
    expect(page).to have_content('User not updated')    
  end
end
