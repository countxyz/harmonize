require 'rails_helper'

feature 'Task management' do
  before(:each) { signin }

  scenario 'creates a new task', js: true do
    visit tasks_path
    click_button 'New'
    within('div.task_description') { fill_in 'Description',  with: 'a' }
  end
end
