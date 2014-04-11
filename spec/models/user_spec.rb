require 'spec_helper'

describe User do

  describe 'empty fields' do
    it 'is invalid without an email address' do
      expect(build(:user, email: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when email has more than 50 characters' do
      expect(build(:user, email: 'a' * 45 + '@a.com')).to_not be_valid
    end    
  end

  describe 'format' do
    it 'is valid with correct email format' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        expect(build(:user, email: valid_address)).to be_valid
      end
    end
  end
end
