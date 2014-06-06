require 'spec_helper'

describe ContactsHelper do

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
