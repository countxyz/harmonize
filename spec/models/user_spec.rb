require 'spec_helper'

describe User do

  describe 'passwords' do
    it 'require password and confirmation' do
      expect(build(:user)).to be_valid
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

  describe 'uniqueness' do
    it 'is invalid when email is used more than once' do
      user_1 = create(:user)
      user_2 = user_1.dup
      expect(user_2).to_not be_valid
    end
  end
end
