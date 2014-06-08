require 'rails_helper'

feature 'Account management' do
  scenario 'delete an account', js: true do
    signin
    account = create(:account)
    visit account_path(account)

    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content('Account deleted')
    expect(current_path).to eq accounts_path
  end
end
