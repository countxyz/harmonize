require 'rails_helper'

feature 'Hidden Links' do
  let(:user)  { create(:user)  }
  let(:admin) { create(:admin) }

  context 'regular user' do
    scenario 'cannot see new button when viewing accounts', js: true do
      sign_in_as!(user)
      visit '/accounts'
      assert_no_link_for 'New'
    end
  end

  context 'admin user' do
    scenario 'can see new button when viewing accounts', js: true do
      sign_in_as!(admin)
      visit '/accounts'
      assert_link_for 'New'
    end
  end
end
