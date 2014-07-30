require 'rails_helper'

describe Phone do

  describe 'associations' do
    it { should belong_to(:phoneable) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:office).is_equal_to(10) }
    it { should ensure_length_of(:mobile).is_equal_to(10) }
    it { should ensure_length_of(:fax).is_equal_to(10)    }
    it { should ensure_length_of(:home).is_equal_to(10)   }
    it { should ensure_length_of(:toll).is_equal_to(10)   }
  end

  describe 'format' do
    it { should allow_value('1234567890').for(:office)         }
    it { should_not allow_value('123456789').for(:office)      }
    it { should_not allow_value('12345678901').for(:office)    }
    it { should_not allow_value('123-456-6789').for(:office)   }
  end
end
