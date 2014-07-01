require 'rails_helper'

feature 'Delete Event' do
  scenario 'delete an account', js: true do
    sign_in_as!(create(:admin))
    create(:event)
    visit '/events'
    click_link 'Meeting'

    click_link 'Delete'
    confirm_dialog

    expect(page).to_not have_content 'Meeting'
  end
end
