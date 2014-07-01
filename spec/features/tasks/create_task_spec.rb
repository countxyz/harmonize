require 'rails_helper'

feature 'Create Task' do
  before do
    sign_in_as!(create(:admin))
    visit '/tasks'
  end

  scenario 'creates a new task', js: true do
    click_link 'New'
    fill_in 'Description', with: 'A New Task'

    click_on 'Submit'
    expect(page).to have_content 'A New Task'
  end

  scenario 'cannot create Task without a description', js: true do
    click_link 'New'

    click_on 'Submit'
    expect(page).to have_content "Description can't be blank"
  end
end
