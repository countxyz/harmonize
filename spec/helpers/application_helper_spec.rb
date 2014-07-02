require 'rails_helper'

describe ApplicationHelper do
  
  describe 'Page Title' do
    it 'displays base title without page title' do
      expect(helper.base_title).to eql 'Harmonize'
    end
    
    it 'displays full title' do
      expect(helper.full_title 'Home').to eql 'Harmonize | Home'
    end
  end

  describe 'Data Format' do
    it "is 'N/A' when data not given" do
      data = ''
      expect(helper.data_format data).to eql 'N/A'
    end
  end

  describe 'Phone Format' do
    it "is 'N/A' when phone not given" do
      phone = ''
      expect(helper.phone_format phone).to eql 'N/A'
    end

    it 'formats phone when given' do
      phone = '5555555555'
      expect(helper.phone_format phone).to eql '(555) 555-5555'
    end
  end

  describe 'logged-in format' do
    it 'is admin format when current user is admin' do
      admin = User.create(handle: 'Art', admin: true)
      expect(helper.logged_in_format admin).to eql "Logged in as Admin: Art"
    end

    it 'is user format when current user is not admin' do
      user = User.create(handle: 'Ben', admin: false)
      expect(helper.logged_in_format user).to eql "Logged in as User: Ben"
    end
  end
end
