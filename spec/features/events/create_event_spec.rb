require 'rails_helper'

feature 'Create Event' do
  scenario 'creates a new event', js: true do
    sign_in_as(create(:admin))
    visit '/events'

    fill_form(:event, attributes_for(:event))
    click_button('Submit')
    expect(page).to have_content 'Meeting'
  end
end
