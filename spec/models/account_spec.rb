require 'spec_helper'

describe Account do

  describe 'empty fields' do
    it 'is invalid without a name' do
      expect(build(:account, name: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when name has fewer than 2 characters' do
      expect(build(:account, name: 'a')).to_not be_valid
    end

    it 'is invalid when name has more than 50 characters' do
      expect(build(:account, name: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when website has fewer than 4 characters' do
      expect(build(:account, website: 'a@a.a')).to_not be_valid
    end

    it 'is invalid when website has more than 50 characters' do
      expect(build(:account, website: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when phone has fewer than 10 characters' do
      expect(build(:account, phone: '1' * 9)).to_not be_valid
    end

    it 'is invalid when phone has more than 10 characters' do
      expect(build(:account, phone: '1' * 11)).to_not be_valid
    end

    it 'is invalid when fax has fewer than 10 characters' do
      expect(build(:account, fax: '1' * 9)).to_not be_valid
    end
    it 'is invalid when fax has more than 10 characters' do
      expect(build(:account, fax: 'a' * 11)).to_not be_valid
    end

    it 'is invalid when email has fewer than 5 characters' do
      expect(build(:account, email: 'a' * 4)).to_not be_valid
    end

    it 'is invalid when email has more than 50 characters' do
      expect(build(:account, email: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when notes has fewer than 2 characters' do
      expect(build(:account, notes: 'a')).to_not be_valid
    end

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:account, notes: 'a' * 1001)).to_not be_valid
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
