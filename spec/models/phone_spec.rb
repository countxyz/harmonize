require 'spec_helper'

describe Phone do
  it 'does not allow duplicate phone numbers per contact' do
    expect(build(:phone, office: '9175555555')).to_not be_valid
  end

  it 'allows two contacts to share a phone number' do
    contact_1 = create(:contact)
    expect(build(:other_contact)).to be_valid
  end

  describe 'format' do
    it 'is invalid without 10 numbers' do
      expect(build(:phone, office: '21255')).to_not be_valid
    end

    it 'is invalid without 10 numbers' do
      expect(build(:phone, mobile: '212555555')).to_not be_valid
    end

    it 'is invalid without 10 numbers' do
      expect(build(:phone, fax: '5555555')).to_not be_valid
    end

    it 'is invalid without 10 numbers' do
      expect(build(:phone, home: '5')).to_not be_valid
    end
  end
end
