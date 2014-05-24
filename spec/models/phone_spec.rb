require 'spec_helper'

describe Phone do
  it { should validate_uniqueness_of(:office).scoped_to(:contact_id) }

  it 'allows two contacts to share a phone number' do
    contact_1 = create(:contact)
    expect(build(:other_contact)).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:contact) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:office).is_equal_to(10) }
    it { should ensure_length_of(:mobile).is_equal_to(10) }
    it { should ensure_length_of(:fax).is_equal_to(10)    }
    it { should ensure_length_of(:home).is_equal_to(10)   }
  end

  describe 'field characters' do
    it { should validate_numericality_of(:office).only_integer }
    it { should validate_numericality_of(:mobile).only_integer }
    it { should validate_numericality_of(:fax).only_integer    }
    it { should validate_numericality_of(:home).only_integer   }
  end
end
