require 'spec_helper'

describe "Main pages" do
  
  describe "Home page" do

    it "has the content 'Harmonize'" do
      visit '/'
      expect(page).to have_content('Harmonize')
    end
  end
end
  