require 'spec_helper'

describe Contact do
  it "returns a contact's full name as a string" do
    contact = build_stubbed(:contact, first_name: 'John', last_name: 'Doe')
    expect(contact.name).to eq 'John Doe'
  end

  it 'is invalid with a duplicate email' do
    invalid_contact = build_stubbed(:contact, email: 'firstemail@firstemail.com',
                                    secondary_email: 'firstemail@firstemail.com')
    expect(invalid_contact).to_not be_valid
  end

  describe 'empty fields' do
    it 'is invalid without a first name' do
      expect(build(:contact, first_name: nil)).to_not be_valid
    end

    it 'is invalid without a last name' do
      expect(build(:contact, last_name: nil)).to_not be_valid
    end

    it 'is invalid without an email address' do
      expect(build(:contact, email: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when first name has more than 30 characters' do
      expect(build(:contact, first_name: 'a' * 31)).to_not be_valid
    end

    it 'is invalid when last name has more than 30 characters' do
      expect(build(:contact, last_name: 'a' * 31)).to_not be_valid
    end

    it 'is invalid when company has more than 50 characters' do
      expect(build(:contact, company: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when email has more than 50 characters' do
      expect(build(:contact, email: 'a' * 45 + '@a.com')).to_not be_valid
    end

    it 'is invalid when secondary email has more than 50 characters' do
      expect(build(:contact, secondary_email: 'a' * 45 + '@a.com')).to_not be_valid
    end

    it 'is invalid when notes has more than 600 characters' do
      expect(build(:contact, notes: 'a' * 601)).to_not be_valid
    end
  end

  describe 'format' do
    it 'is valid with correct email format' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        expect(build(:contact, email: valid_address)).to be_valid
      end
    end
  end
end
