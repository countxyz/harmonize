require 'rails_helper'

feature 'Hidden Links' do
  let(:user)  { create(:user)  }
  let(:admin) { create(:admin) }

  context 'regular user' do
    before { sign_in_as!(user) }

    scenario 'cannot see new button when viewing contacts', js: true do
      visit '/accounts'
      assert_no_link_for 'New'
    end

    scenario 'cannot see the Delete button when viewing a contact', js: true do
      create(:contact)
      visit '/contacts'
      click_link 'Art'

      assert_no_link_for 'Delete'
    end

    scenario 'cannot see the Edit button when viewing a contact', js: true do
      create(:contact)
      visit '/contacts'
      click_link 'Art'

      assert_no_link_for 'edit'
    end
  end

  context 'admin user' do
    before { sign_in_as!(admin) }

    scenario 'can see new button when viewing contacts', js: true do
      visit '/contacts'
      assert_link_for 'NEW'
    end

    scenario 'can see the Delete button when viewing a contact', js: true do
      create(:contact)
      visit '/contacts'
      click_link 'Art'

      assert_link_for 'Delete'
    end

    scenario 'can see the Edit button when viewing a contact', js: true do
      create(:contact)
      visit '/contacts'
      click_link 'Art'

      assert_link_for 'edit'
    end
  end
end
