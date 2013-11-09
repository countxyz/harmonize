require 'spec_helper'

describe "Main pages" do
  
  describe "Home page" do
    before :each do
      visit '/'
    end

    it "has the content 'Harmonize'" do
      expect(page).to have_content('Harmonize')
    end

    it "has title 'Harmonize | Home'" do
      expect(page).to have_title("Harmonize | Home")
    end
  end
end
  