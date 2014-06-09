require 'rails_helper'

feature 'Delete Account' do
  scenario 'delete an account', js: true do
    sign_in_as(create(:admin))
    visit account_path(create(:account))

    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content('Account deleted')
    expect(current_path).to eq accounts_path
  end
end
