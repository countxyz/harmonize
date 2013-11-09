require 'spec_helper'

describe "Home" do

  before { visit root_path }

  describe "title" do
  
    it "has title 'Harmonize | Home'" do
      expect(page).to have_title("Harmonize | Home")
    end
  end

  describe "content" do

    it "has an h1 'Harmonize'" do
      page_title = find('#page_header').find('h1')
      expect(page_title).to have_content('Harmonize')
    end

    it "has a link to Projects index page in side menu" do
      find('#main_content').click_link('Projects')
      expect(page).to have_content 'All Projects'
    end
  end

  describe "Home page side menu" do

    it "has a link to Projects index page in main content" do
      find('#side_menu_list').click_link('Projects')
      expect(page).to have_content 'All Projects'
    end
  end
end
  