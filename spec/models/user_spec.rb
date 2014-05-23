require 'spec_helper'

describe User do

  describe 'passwords' do
    it 'require password and confirmation' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'field lengths' do
    it { should ensure_length_of(:email).is_at_least(5).is_at_most(50) } 
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
    it { should validate_uniqueness_of(:email) }
  end
end
