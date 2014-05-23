require 'spec_helper'

describe Account do

  describe 'presence' do
    it { should validate_presence_of(:name) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(50)    }
    it { should ensure_length_of(:website).is_at_least(6).is_at_most(50) }
    it { should ensure_length_of(:phone).is_equal_to(10)                 }
    it { should ensure_length_of(:fax).is_equal_to(10)                   }
    it { should ensure_length_of(:email).is_at_least(5).is_at_most(50)   }
    it { should ensure_length_of(:notes).is_at_least(2).is_at_most(1000) }
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
