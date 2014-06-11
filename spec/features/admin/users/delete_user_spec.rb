require 'rails_helper'

feature 'Delete Account' do
  let!(:admin) { create(:admin) }
  let!(:user)  { create(:user)  }

  before do
    sign_in_as(admin)
    visit '/admin/users'
  end

  scenario 'delete an account', js: true do
    click_link user.handle
    click_on 'Delete'
    confirm_dialog

    expect(page).to have_content('User deleted')
    expect(current_path).to eq admin_users_path
  end
end
