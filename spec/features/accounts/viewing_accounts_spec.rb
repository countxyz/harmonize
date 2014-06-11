require 'rails_helper'

feature 'Viewing accounts' do
  let!(:user)    { create(:user)     }
  let!(:account) { create(:account)  }

  before do
    sign_in_as(user)
    define_permission(user, :view, account)
  end

  scenario 'Listing all accounts', js: true do
    visit '/accounts'
    click_link account.name

    expect(page.current_url).to eql(account_url(account))
  end
end
