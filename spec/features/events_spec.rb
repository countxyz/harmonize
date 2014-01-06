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
end