require 'rails_helper'

feature 'Update Event' do
  before do
    sign_in_as!(create(:admin))
    create(:event)
    visit '/events'
    click_link 'Meeting'
  end

  scenario 'update event', js: true do
    fill_in 'Description', with: 'Boring Meeting'
    click_on   'Submit'

    expect(page).to have_content 'Meeting'
  end

  scenario 'cannot update event with invalid attributes', js: true do
    fill_in 'Description', with: ''
    click_on 'Submit'

    expect(page).to have_content "Description can't be blank"
  end
end
