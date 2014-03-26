require 'spec_helper'

feature 'Project management' do
  scenario 'creates a new project', js: true do
    visit root_path
    click_button('New')
    within('div.project_name')     { fill_in 'Name',     with: 'Vandalay'   }
    within('div.project_website')  { fill_in 'Website',  with: 'target.com' }
    within('div.project_employer') { fill_in 'Employer', with: 'Target'     }
    fill_in 'Notes', with: 'Bring your A game with Vandalay.'
    click_on 'Create Project' 
    expect(page).to have_content('Project has been created')
  end

  scenario 'it updates a project', js: true do
    project = create(:project)
    visit edit_project_path(project)
    within('div.project_name') { fill_in 'Name', with: 'b' }
    click_on 'Update Project'
    expect(page).to have_content('Project has been updated')
    expect(current_path).to eq project_path(project)
  end

  scenario 'delete a project' do
    project = create(:project)
    visit project_path(project)
    click_link('Delete')
    expect(page).to have_content('Project has been deleted')
    expect(current_path).to eq projects_path
  end
end
