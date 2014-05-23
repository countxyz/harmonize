require 'spec_helper'

describe Assignment do

  describe 'presence' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:status)      }
    it { should validate_presence_of(:priority)    }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:description).is_at_most(100) }
    it { should ensure_length_of(:notes).is_at_most(1000)      }
  end

  describe 'status' do
    context 'valid entry' do
      ['Not Started', 'In Progress', 'Completed'].each do |valid_status|

        it "is valid with 'Not Started', 'In Progress', 'Completed'" do
          expect(build(:assignment, status: valid_status)).to be_valid
        end
      end
    end

    context 'invalid entry' do
      it "is invalid without 'Not Started', 'In Progress', 'Completed'" do
        expect(build(:assignment, status: 'a')).to_not be_valid
      end
    end
  end

  describe 'priority' do
    context 'valid entry' do
      %w[Low High Urgent N/A].each do |valid_priority|

        it "is valid with 'N/A', 'Low', 'High', 'Urgent'" do
          expect(build(:assignment, priority: valid_priority)).to be_valid
        end
      end
    end

    context 'invalid entry' do
      it "is invalid without 'N/A', 'Low', 'High', 'Urgent'" do
        expect(build(:assignment, priority: 'a')).to_not be_valid
      end
    end
  end

  describe 'invalid dates' do
    it 'cannot be completed before start date' do
      expect(create(:invalid_date)).to_not be_valid
    end
  end
end
