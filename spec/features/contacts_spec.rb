require 'spec_helper'

feature 'Contact management' do
  scenario 'creates a new contact', :js => true do

    visit root_path
    click_on 'Contacts'
    click_on 'New Contact'
    fill_in 'First Name', with: 'Art'
    fill_in 'Last Name', with: 'Vandalay'
    within('.contact_email') do
      fill_in 'Email', with: 'artvandalay@vandalay.com'
    end
    fill_in 'Secondary Email', with: 'artshizzle@gmail.com'
    fill_in 'Notes', with: 'The Vandalays are priority.'
    fill_in 'Office', with: '2125555555'
    fill_in 'Mobile', with: '9175555555'
    fill_in 'Fax', with: '2125555556'
    fill_in 'Home', with: '5165555555'
    click_on 'Create Contact'
    expect(page).to have_content('Contact has been created')
  end

  scenario 'does not create a new contact', :js => true do

    visit new_contact_path
    click_on 'Create Contact'
    expect(page).to have_content('Contact has not been created')
  end

  scenario 'it updates a contact', :js => true do
    
    contact = create(:contact)
    visit edit_contact_path(contact)
    fill_in 'First Name', with: 'b'
    click_on 'Update Contact'
    expect(page).to have_content('Contact has been updated')
    expect(current_path).to eq contact_path(contact)
  end

  scenario 'it does not update a contact', :js => true do

    contact = create(:contact)
    visit edit_contact_path(contact)
    fill_in 'Mobile', with: '1'
    click_on 'Update Contact'
    expect(page).to have_content('Contact has not been updated')
  end

  scenario 'delete a contact' do
    
    contact = create(:contact)
    visit contact_path(contact)
    click_link('Delete Contact')
    expect(page).to have_content('Contact has been deleted')
    expect(current_path).to eq contacts_path
  end
end