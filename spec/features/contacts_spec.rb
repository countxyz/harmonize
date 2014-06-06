require 'spec_helper'

feature 'Contact management' do
  scenario 'creates a new contact', js: true do
    signin

    click_link 'New'
    fill_in 'First Name', with: 'Art'
    click_on 'Create Contact'

    expect(page).to have_content('Contact created')
  end

  scenario 'it updates contact', js: true do
    signin
    contact = create(:contact)
    visit contact_path(contact)

    click_link 'ci-panel'
    fill_in 'Last Name', with: 'Vandalay'
    click_on 'Update Contact'

    expect(page).to have_content('Contact updated')
  end

  scenario 'delete a contact', js: true do
    signin
    contact = create(:contact)
    visit contact_path(contact)

    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content('Contact deleted')
    expect(current_path).to eq contacts_path
  end
end
