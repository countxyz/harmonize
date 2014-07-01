require 'rails_helper'

feature 'Create Event' do
  before do
    sign_in_as!(create(:admin))
    visit '/events'
    click_link 'New'
  end

  scenario 'creates a new event', js: true do
    fill_form(:event, attributes_for(:event))
    click_button 'Submit'

    expect(page).to have_content 'Meeting'
  end

  scenario 'cannot create event without a name', js: true do
    click_button 'Submit'

    expect(page).to have_content "Description can't be blank"
  end
end
