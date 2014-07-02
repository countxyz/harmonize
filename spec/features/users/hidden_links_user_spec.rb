require 'rails_helper'

feature 'Hidden Links' do

  context 'regular user' do
    scenario 'cannot see admin button when logging in', js: true do
      sign_in_as!(create(:user))
      visit '/'
      assert_no_link_for 'Admin'
    end
  end

  context 'admin user' do
    scenario 'can see admin button when logging in', js: true do
      sign_in_as!(create(:admin))
      visit '/'
      assert_link_for 'Admin'
    end
  end
end
