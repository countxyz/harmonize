require 'rails_helper'

feature 'Account management' do
  scenario 'create a new account', js: true do
    signin
    visit '/accounts/new'

    fill_in 'Name', with: 'Vandalay Industries'
    click_on 'Create Account'

    expect(page).to have_content('Account created')
  end

  scenario 'update account', js: true do
    signin
    account = create(:account)
    visit account_path(account)

    click_link 'ai-panel'
    fill_in 'Notes', with: 'Vandalay Rocks!'
    click_on 'Update Account'

    expect(page).to have_content('Account updated')
  end

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
