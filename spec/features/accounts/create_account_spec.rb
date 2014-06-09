require 'rails_helper'

feature 'Create Account' do
  before do
    sign_in_as(create(:admin))
    visit '/accounts/new'
  end

  scenario 'create a new account', js: true do
    fill_in 'Name', with: 'Vandalay Industries'

    click_on 'Create Account'
    expect(page).to have_content('Account created')
  end

  scenario 'cannot create account without a name', js: true do
    click_on 'Create Account'
    expect(page).to have_content('Account not created')
  end
end
