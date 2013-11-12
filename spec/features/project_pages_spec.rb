require 'spec_helper'

describe "Project pages" do

  describe "Index page" do
    before { visit projects_path }

    it "has title 'Harmonize | All Projects'" do
      expect(page).to have_title("Harmonize | All Projects")
    end

    it "has h2 'All Projects'" do
      page_title = find('#main_content').find('h2')
      expect(page_title).to have_content('All Projects')
    end

    it "has link to Projects new project page" do
      find('#main_content').click_link('New Project')
      expect(current_path).to eq new_project_path
    end
  end

  describe "New Project page" do
    before { visit new_project_path }

    it "has title 'Harmonize | New Project'" do
      expect(page).to have_title("Harmonize | New Project")
    end
    
    it "has h2 'New Project'" do
      page_title = find('#main_content').find('h2')
      expect(page_title).to have_content('New Project')
    end

    it "has form requirements" do
      expect(page).to have_content('* Fields Required')
      expect(page).to have_content('Dates must have Month,
                                    Day, and Year to be saved')
    end
  end

  describe "Show Project page" do
    let(:project) { FactoryGirl.create(:project) }
    before { visit project_path(project) }

    it "has h2 'All Projects'" do
      page_title = find('#main_content').find('h2')
      expect(page_title).to have_content('a')
    end
    
    it "has link to Projects index page" do
      find('#main_content').click_link('Projects')
      expect(current_path).to eq projects_path
    end

    it "has link to Project edit page" do
      find('#main_content').click_link('Edit Project')
      expect(current_path).to eq edit_project_path(project)
    end

    it "has link to delete Project" do
      find('#main_content').click_link('Delete Project')
      expect(current_path).to eq projects_path
      expect(page).to have_content "Project has been deleted."
    end
  end
end
