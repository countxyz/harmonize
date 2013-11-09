require 'spec_helper'

describe "Project pages" do

  describe "Index page" do
    before { visit project_path }

    it "has title 'Harmonize | All Projects'" do
      expect(page).to have_title("Harmonize | All Projects")
    end
  end
end
