require 'rails_helper'

feature 'Delete Contact' do
  scenario 'delete a contact', js: true do
    sign_in_as!(create(:admin))
    create(:contact)
    visit '/contacts'
    click_link 'Art'

    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content 'Contact deleted'
    expect(current_path).to eq contacts_path
  end
end
