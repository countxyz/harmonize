require "spec_helper"

feature "Project management" do
  scenario "creates a new project", :js => true do

    visit root_path
    click_on "Projects"
    click_on "New Project"
    fill_in "Name", with: "Vandelay"
    fill_in "Role", with: "Build prototype"
    choose("project_status_completed")
    choose("project_priority_na")
    fill_in "Notes", with: "Bring your A game with Vandelay."
    fill_in "Start Date", with: "10/01/2013"
    fill_in "Target Date", with: "10/02/2013"
    fill_in "Deadline", with: "10/03/2013"
    fill_in "Completion Date", with: "10/04/2013"
    click_on "Create Project" 
    expect(page).to have_content("Project has been created.")
    find_link("Edit Project").visible?
    find_link("Delete Project").visible?
  end

  scenario "does not create a new project", :js => true do

    visit new_project_path
    click_on "Create Project"
    expect(page).to have_content("Project has not been created.")
  end

  scenario "it updates a project", :js => true do

    project = create(:project)
    visit edit_project_path(project)
    fill_in "Name", with: "b"
    click_on "Update Project"
    expect(page).to have_content("Project has been updated.")
    expect(current_path).to eq project_path(project)
  end

  scenario "it does not update a project", :js => true do

    project = create(:project_all_fields)
    visit edit_project_path(project)
    fill_in "Start Date", with: "05/05/2013"
    click_on "Update Project"
    expect(page).to have_content("Project has not been updated.")
  end

  scenario "delete a project" do

    project = create(:project)
    visit project_path(project)
    click_link("Delete Project")
    expect(page).to have_content("Project has been deleted.")
    expect(current_path).to eq projects_path
  end
end