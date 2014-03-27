require 'spec_helper'

feature 'Contact management' do
  scenario 'creates a new contact', js: true do
    visit contacts_path
    click_button('New')
    within('div.contact_first_name') { fill_in 'First Name', with: 'Art'      }
    within('div.contact_last_name')  { fill_in 'Last Name',  with: 'Vandalay' }
    within('div.contact_company')    { fill_in 'Company',    with: 'Target'   }
    within('div.contact_email')      { fill_in 'Email', with: 'art@target.com'}
    within('div.contact_secondary_email') { fill_in 'Secondary Email',
                                            with: 'art@gmail.com' } 
    fill_in 'Notes', with: 'The Vandalays are priority.'
    click_button('Add Phone')
    within('div.contact_phone_office')  { fill_in 'Office', with: '2125555555' }
    within('div.contact_phone_mobile')  { fill_in 'Mobile', with: '9175555555' }
    within('div.contact_phone_fax')     { fill_in 'Fax',    with: '2125555556' }
    within('div.contact_phone_home')    { fill_in 'Home',   with: '5165555555' }
    click_on 'Create Contact'
    expect(page).to have_content('Contact has been created')
  end

  # Bug with Capybara and after hooks with Ajax. Wait for update.

  # scenario 'it updates a contact', js: true do 
  #   contact = create(:contact)
  #   visit edit_contact_path(contact)
  #   within('div.contact_first_name') { fill_in 'First Name', with: 'b' }
  #   click_button('Add Phone')
  #   within('section.button_center') { click_on 'Update Contact' }
  #   expect(page).to have_content('Contact has been updated')
  #   expect(current_path).to eq contact_path(contact)
  # end

  # scenario 'delete a contact' do  
  #   contact = create(:contact)
  #   visit contact_path(contact)
  #   click_button('Delete')
  #   expect(page).to have_content('Contact has been deleted')
  #   expect(current_path).to eq contacts_path
  # end
end
