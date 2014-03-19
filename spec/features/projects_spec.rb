require 'spec_helper'

feature 'Project management' do
  scenario 'creates a new project', js: true do
    visit root_path
    click_on 'Projects'
    click_on 'New Project'
    within('div.project_name')     { fill_in 'Name',     with: 'Vandalay'   }
    within('div.project_role')     { fill_in 'Role',     with: 'Refactor'   }
    within('div.project_website')  { fill_in 'Website',  with: 'target.com' }
    within('div.project_employer') { fill_in 'Employer', with: 'Target'     }
    select('In Progress', from: 'Status'  )
    select('High',        from: 'Priority')
    fill_in 'Notes',           with: 'Bring your A game with Vandalay.'
    fill_in 'Start Date',      with: '2013-10-01'
    fill_in 'Target Date',     with: '2013-10-02'
    fill_in 'Deadline',        with: '2013-10-03'
    fill_in 'Completion Date', with: '2013-10-04'
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
    click_link('Delete Project')
    expect(page).to have_content('Project has been deleted')
    expect(current_path).to eq projects_path
  end
end
