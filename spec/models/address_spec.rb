require 'spec_helper'

describe Address do

  describe 'presence' do
    it { should validate_presence_of(:street_1)    }
    it { should validate_presence_of(:city)        }
    it { should validate_presence_of(:state)       }
    it { should validate_presence_of(:postal_code) }
  end

  describe 'length' do
    it { should ensure_length_of(:street_1).is_at_most(100) }
    it { should ensure_length_of(:street_2).is_at_most(100) }
    it { should ensure_length_of(:city).is_at_most(50)      }
  end

  describe 'numericality' do
    it { should validate_numericality_of(:postal_code).only_integer }
  end
end
