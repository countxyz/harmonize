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
end
