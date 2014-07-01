require 'rails_helper'

feature 'Update Task' do
  before do 
    sign_in_as!(create(:admin))
    create(:task)
    visit '/tasks'
    click_link 'Edit'
  end

  scenario 'update task', js: true do
    fill_in 'Description', with: 'An edited task'

    click_on 'Submit'
    expect(page).to have_content 'An edited task'
  end

  scenario 'cannot update with invalid attributes', js: true do
    fill_in 'Description', with: ''

    click_on 'Submit'
    expect(page).to have_content "Description can't be blank"
  end
end
