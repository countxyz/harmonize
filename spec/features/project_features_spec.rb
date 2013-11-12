require 'spec_helper'
require 'capybara'

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


  scenario "edit a project" do
    project = create(:project)
    visit edit_project_path(project)
      fill_in 'Name', with: 'b'
      choose("Not Started")
      choose("Low")
      click_button 'Update Project'
      expect(page).to have_text("Project has been updated.")
  end
end