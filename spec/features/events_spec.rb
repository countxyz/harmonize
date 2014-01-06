require 'spec_helper'

feature 'Event management' do
  scenario 'creates a new event', :js => true do

    visit root_path
    click_on 'Create Event'
    fill_in 'Title', with: 'Vandalay Prototype'
    fill_in 'Description', with: 'Build prototype for the new Vandalay site.'
    select('2013',      :from => 'event_start_time_1i')
    select('December',  :from => 'event_start_time_2i')
    select('29',        :from => 'event_start_time_3i')
    select('16',        :from => 'event_start_time_4i')
    select('30',        :from => 'event_start_time_5i')
    select('2013',      :from => 'event_end_time_1i')
    select('December',  :from => 'event_end_time_2i')
    select('31',        :from => 'event_end_time_3i')
    select('16',        :from => 'event_end_time_4i')
    select('30',        :from => 'event_end_time_5i')
    check('All Day')
    click_on 'Create Event'
    expect(page).to have_content('Event has been created')
  end

  scenario 'does not create a new event', :js => true do

    visit new_event_path
    click_on 'Create Event'
    expect(page).to have_content('Event has not been created')
  end

  scenario 'it updates an event', :js => true do
    event = create(:event)
    visit edit_event_path(event)
    fill_in 'Title', with: 'b'
    click_on 'Update Event'
    expect(page).to have_content('Event has been updated')
    expect(current_path).to eq root_path
  end

  scenario 'it does not update an event', :js => true do

    event = create(:event)
    visit edit_event_path(event)
    fill_in 'Title', with: ''
    click_on 'Update Event'
    expect(page).to have_content('Event has not been updated')
  end

  scenario 'delete an event' do

    event = create(:event)
    visit event_path(event)
    click_link('Delete Event')
    expect(page).to have_content('Event has been deleted')
    expect(current_path).to eq root_path
  end
end
