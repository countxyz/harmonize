require 'spec_helper'

feature 'Account management' do
  scenario 'creates a new account', js: true do
    signin
    visit '/accounts/new'

    fill_in 'Name', with: 'Vandalay Industries'
    click_on 'Create Account'

    expect(page).to have_content('Account created')
  end

  scenario 'it updates account', js: true do
    signin
    account = create(:account)
    visit account_path(account)

    click_link 'ai-panel'
    fill_in 'Notes', with: 'Vandalay Rocks!'
    click_on 'Update Account'

    expect(page).to have_content('Contact updated')
  end

  # scenario 'delete a contact', js: true do
  #   signin
  #   contact = create(:contact)
  #   visit contact_path(contact)

  #   click_on 'Delete'
  #   confirm_dialog

  #   expect(page).to have_content('Contact deleted')
  #   expect(current_path).to eq contacts_path
  # end
end
