require 'rails_helper'

feature 'Hidden Links' do
  let(:user)  { create(:user)  }
  let(:admin) { create(:admin) }

  context 'regular user' do
    before do
      sign_in_as!(user)
      create(:task)
      visit '/tasks'
    end

    scenario 'cannot see Admin button when viewing tasks', js: true do
      assert_no_link_for 'ADMIN'
    end

    scenario 'cannot see New button when viewing tasks', js: true do
      assert_no_link_for 'New'
    end

    scenario 'cannot see Complete button when viewing tasks', js: true do
      assert_no_link_for 'Complete'
    end

    scenario 'cannot see Delete button when viewing tasks', js: true do
      assert_no_link_for 'Delete'
    end

    scenario 'cannot see Edit button when viewing tasks', js: true do
      assert_no_link_for 'Edit'
    end
  end

  context 'admin user' do
    before do
      sign_in_as!(admin)
      create(:task)
      visit '/tasks'
    end

    scenario 'can see Admin button when viewing tasks', js: true do
      assert_link_for 'ADMIN'
    end

    scenario 'can see New button when viewing tasks', js: true do
      assert_link_for 'New'
    end

    scenario 'can see Complete button when viewing tasks', js: true do
      assert_link_for 'Complete'
    end

    scenario 'can see Delete button when viewing tasks', js: true do
      assert_link_for 'Delete'
    end

    scenario 'can see Edit button when viewing tasks', js: true do
      assert_link_for 'Edit'
    end
  end
end
