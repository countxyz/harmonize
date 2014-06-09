require 'rails_helper'

feature 'Create User' do
  before do
    sign_in_as(create(:admin))
    visit '/admin/users/new'
  end

  scenario 'Creating a new user', js: true do
    fill_in 'Username', with: 'Art'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'

    click_on 'Create User'
    expect(page).to have_content 'User created'
  end
end
