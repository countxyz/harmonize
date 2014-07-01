require 'rails_helper'

feature 'Delete Account' do
  scenario 'delete a task', js: true do
    sign_in_as!(create(:admin))
    create(:task)
    visit '/tasks'
    
    click_link 'Delete'
    confirm_dialog

    expect(current_path).to eq tasks_path
  end
end
