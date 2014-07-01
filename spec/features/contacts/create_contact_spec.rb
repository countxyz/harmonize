require 'rails_helper'
  
feature 'Create Contact' do
  before do
    sign_in_as!(create(:admin))
    visit '/contacts/new'
  end

  scenario 'creates a new contact', js: true do
    fill_in 'First Name', with: 'Art'

    click_on 'Create Contact'
    expect(page).to have_content 'Contact created'
  end

  scenario 'cannot create contact without a first name', js: true do
    click_on 'Create Contact'
    expect(page).to have_content 'Contact not created'
  end
end
