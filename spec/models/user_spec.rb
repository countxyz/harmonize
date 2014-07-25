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
    context 'correct password submitted' do
      it 'authenticates successfully' do
        expect(build(:user).authenticate('password')).to be
      end
    end

    context 'incorrect password submitted' do
      it 'does not authenticate' do
        expect(build(:user).authenticate('passwordy')).to_not be
      end
    end
  end

  describe 'name' do
    context 'when names are provided' do
      it 'first and last name joined as string' do
        expect(build(:user,
          first_name: 'a', last_name: 'b').formatted_name).to eq 'a b'
      end
    end

    context 'when names are not provided' do
      it "formats 'N/A'" do
        expect(build(:user).formatted_name).to eq 'N/A'
      end
    end
  end
end
