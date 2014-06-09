require 'rails_helper'

feature 'hidden links' do
  let(:user)  { create(:user)  }
  let(:admin) { create(:admin) }

  context 'standard users' do
    before { sign_in_as(user) }

    scenario 'cannot see the New Account link' do
      visit '/accounts'
      assert_no_link_for 'New'
    end

    scenario 'cannot see the New Contact link' do
      visit '/accounts'
      assert_no_link_for 'New'
    end
  end

  context 'admin users' do
    before { sign_in_as(admin) }

    scenario 'can see the New Account link' do
      visit '/accounts'
      assert_link_for 'New'
    end

    scenario 'can see the New Contact link' do
      visit '/accounts'
      assert_link_for 'New'
    end
  end
end
