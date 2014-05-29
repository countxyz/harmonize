require 'spec_helper'

describe User do

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:handle) }
  end

  describe 'presence' do
    it { should validate_presence_of(:handle)          }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:handle).is_at_least(3).is_at_most(20) }
    it { should ensure_length_of(:email).is_at_least(5).is_at_most(50)  }
    it { should ensure_length_of(:first_name).is_at_most(30)            }
    it { should ensure_length_of(:last_name).is_at_most(30)             }
  end

  describe 'format' do
    it { should allow_value('abc@xyz.com').for(:email) }
  end

  describe 'passwords' do
    it 'require password and confirmation' do
      expect(build(:user)).to be_valid
    end
  end
end
