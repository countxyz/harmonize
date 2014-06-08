require 'rails_helper'

feature 'Account management' do
  scenario 'create a new account', js: true do
    signin
    visit '/accounts/new'

    fill_in 'Name', with: 'Vandalay Industries'
    click_on 'Create Account'

    expect(page).to have_content('Account created')
  end
end
