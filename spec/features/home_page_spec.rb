require 'spec_helper'

describe "Home" do

  before { visit root_path }

  describe "title" do
  
    it "has title 'Harmonize | Home'" do
      expect(page).to have_title("Harmonize | Home")
    end
  end

  describe "side menu" do

    it "has h1 'Harmonize'" do
      page_header = find('#side_menu').find('h1')
      expect(page_header).to have_content('Harmonize')
    end

    it "has link to Home page" do
      click_link('Home')
      expect(current_path).to eq root_path
    end

    it "has link to Projects index page" do
      find('#side_menu_list').click_link('Projects')
      expect(current_path).to eq projects_path
    end
  end

  describe "page header" do

    it "has h1 'Overview Home'" do
      page_header = find('.section_header').find('h1')
      expect(page_header).to have_content('Overview Home')
    end
  end

  describe "content" do

    it "has h2 'Current Projects'" do
      content_title = find('#main_content').find('h2')
      expect(content_title).to have_content('Current Projects')
    end
  end
end
  