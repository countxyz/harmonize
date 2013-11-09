require 'spec_helper'

describe "Main pages" do
  
  describe "Home page" do
    before { visit root_path }

    it "has title 'Harmonize | Home'" do
      expect(page).to have_title("Harmonize | Home")
    end

    it "has an h1 'Harmonize'" do
      expect(page).to have_content('Harmonize')
    end
  end
end
  