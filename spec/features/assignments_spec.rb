require 'rails_helper'

feature 'Assignment management' do
  scenario 'creates a new assignment', js: true do
    project = create(:project)
    visit project_path(project)
    find(:xpath, '//*[@id="new_assignment"]').click
    fill_in 'Description', with: 'New Assignment Form'
    select('In Progress', from: 'Status')
    select('Low', from: 'Priority')
    fill_in 'Start Date',  with: '2014-03-24'
    fill_in 'Target Date', with: '2014-03-25'
    fill_in 'Deadline',    with: '2014-03-26'
    fill_in 'Completed',   with: '2014-03-27'
    fill_in 'Notes', with: 'Needs to be on Project profile page.'
    click_on 'Create'
    expect(page).to have_content('Assignment has been added')
  end
end
