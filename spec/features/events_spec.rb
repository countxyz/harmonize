require 'spec_helper'

feature 'Event management' do
  scenario 'creates a new event', js: true do
    visit events_path
    click_button('New')
    fill_in 'Title',       with: 'Vandalay Prototype'
    fill_in 'Description', with: 'Build prototype for the new Vandalay site.'
    fill_in 'Start',       with: '04/01/2014'
    fill_in 'End',         with: '04/02/2014'
    click_on 'Create Event'
    expect(page).to have_content('Event has been created')
  end

  scenario 'it updates an event', js: true do
    event = create(:event)
    visit edit_event_path(event)
    fill_in 'Title', with: 'b'
    click_on 'Update Event'
    expect(page).to have_content('Event has been updated')
    expect(current_path).to eq event_path(event)
  end

  scenario 'delete an event' do
    event = create(:event)
    visit event_path(event)
    click_link('Delete')
    expect(page).to have_content('Event has been deleted')
    expect(current_path).to eq events_path
  end
end
