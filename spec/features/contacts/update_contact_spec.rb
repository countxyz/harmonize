require 'rails_helper'

feature 'Update Contact' do
  before do
    sign_in_as!(create(:admin))
    create(:contact)
    visit '/contacts'
    click_link 'Art'
    click_link 'ci-panel'
  end

  scenario 'update contact', js: true do
    fill_in 'Notes', with: 'Update TPS reports'

    click_on 'Update Contact'
    expect(page).to have_content 'Contact updated'
  end

  scenario 'cannot update account with invalid attributes', js: true do
    fill_in 'First Name', with: ''

    click_on 'Update Contact'
    expect(page).to have_content 'Contact not updated'
  end
end
