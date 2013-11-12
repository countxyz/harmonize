require 'spec_helper'

feature 'Project management' do
  scenario "creates a new project" do
    visit new_project_path
      fill_in 'Name', with: 'a'
      choose("Not Started")
      choose("Low")
      click_button 'Create Project'
      expect(page).to have_text("Project has been created.")
  end

  scenario "does not create a new project" do
    visit new_project_path
      click_button 'Create Project'
      expect(page).to have_text("Project has not been created.")
  end
end