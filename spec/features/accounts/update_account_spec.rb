require 'rails_helper'

feature 'Update Account' do
  before do
    sign_in_as(create(:admin))
    visit account_path(create(:account))
    click_link 'ai-panel'
  end

  scenario 'update account', js: true do
    fill_in 'Notes', with: 'Vandalay Rocks!'

    click_on 'Update Account'
    expect(page).to have_content('Account updated')
  end

  scenario 'cannot update account with invalid attributes', js: true do
    fill_in 'Name', with: ''

    click_on 'Update Account'
    expect(page).to have_content('Account not updated')    
  end
end
