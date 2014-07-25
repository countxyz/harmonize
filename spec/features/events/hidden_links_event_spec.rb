require 'rails_helper'

feature 'Hidden Links' do
  let(:user)  { create(:user)  }
  let(:admin) { create(:admin) }

  context 'regular user' do
    before { sign_in_as!(user) }

    scenario 'cannot see new button when viewing events', js: true do
      visit '/events'
      assert_no_link_for 'NEW'
    end

    scenario 'cannot see admin button when viewing events', js: true do
      visit '/events'
      assert_no_link_for 'ADMIN'
    end
  end

  context 'admin user' do
    before { sign_in_as!(admin) }

    scenario 'can see new button when viewing events', js: true do
      visit '/events'
      assert_link_for 'NEW'
    end

    scenario 'can see admin button when viewing events', js: true do
      visit '/events'
      assert_link_for 'ADMIN'
    end
  end
end
