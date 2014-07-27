require 'rails_helper'

describe Address do

  describe 'presence' do
    it { should validate_presence_of(:street_1)    }
    it { should validate_presence_of(:city)        }
    it { should validate_presence_of(:state)       }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:country)     }
    it { should validate_presence_of(:type)        }
  end

  describe 'inclusion' do
    it do
      should ensure_inclusion_of(:type).
      in_array(%w( BillingAddress ShippingAddress ))
    end
  end

  describe 'length' do
    it { should ensure_length_of(:street_1).is_at_most(100)                  }
    it { should ensure_length_of(:street_2).is_at_most(100)                  }
    it { should ensure_length_of(:city).is_at_most(50)                       }
    it { should ensure_length_of(:state).is_equal_to(2)                      }
    it { should ensure_length_of(:postal_code).is_at_least(5).is_at_most(10) }
    it { should ensure_length_of(:country).is_at_most(30)                    }
    it { should ensure_length_of(:type).is_at_least(14).is_at_most(15)       }
  end

  describe 'format' do
    context 'state' do
      it { should allow_value('ny').for(:state)      }
      it { should_not allow_value('nyc').for(:state) }
      it { should_not allow_value('12').for(:state)  }
    end

    context 'postal_code' do
      it { should allow_value('12345').for(:postal_code)           }
      it { should allow_value('12345-6789').for(:postal_code)      }
      it { should_not allow_value('1234').for(:postal_code)        }
      it { should_not allow_value('123456').for(:postal_code)      }
      it { should_not allow_value('1234-5678').for(:postal_code)   }
      it { should_not allow_value('123456-7890').for(:postal_code) }
    end
  end

  describe 'location' do
    it 'provides city and state of address' do
      expect(build(:address).location).to eq 'New York, NY'
    end
  end
end
