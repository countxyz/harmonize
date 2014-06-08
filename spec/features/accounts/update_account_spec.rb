require 'rails_helper'

feature 'Account management' do
  scenario 'update account', js: true do
    signin
    account = create(:account)
    visit account_path(account)
    
    click_link 'ai-panel'
    fill_in 'Notes', with: 'Vandalay Rocks!'
    click_on 'Update Account'

    expect(page).to have_content('Account updated')
  end
end
