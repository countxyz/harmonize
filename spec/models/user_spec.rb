require 'rails_helper'

describe User do

  describe 'associations' do
    it { should have_many(:emails).dependent(:destroy)   }
    it { should have_many(:accounts).dependent(:destroy) }
    it { should have_many(:contacts).dependent(:destroy) }
    it { should have_many(:events).dependent(:destroy)   }
    it { should have_many(:tasks).dependent(:destroy)    }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:handle) }
  end

  describe 'presence' do
    it { should validate_presence_of(:handle)          }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:handle).is_at_least(3).is_at_most(20) }
    it { should ensure_length_of(:first_name).is_at_most(30)            }
    it { should ensure_length_of(:last_name).is_at_most(30)             }
  end

  describe 'password' do
    it 'requires password and confirmation' do
      expect(build(:user)).to be
    end
  end

  describe 'authentication' do
    it 'authenticates with a correct password' do
      expect(build(:user).authenticate('password')).to be
    end

    it 'does not authenticate with an incorrect password' do
      expect(build(:user).authenticate('passwordy')).to_not be
    end
  end
end
