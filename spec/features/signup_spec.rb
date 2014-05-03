require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid handle and password' do
    signup_with 'BigBird', 'password'
  end
end
