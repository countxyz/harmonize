require 'spec_helper'

describe Assignment do

  describe 'empty fields' do
    it 'is invalid without a description' do
      expect(build(:assignment, description: nil)).to_not be_valid
    end

    it 'is invalid without a status' do
      expect(build(:assignment, status: nil)).to_not be_valid
    end

    it 'is invalid without a priority' do
      expect(build(:assignment, priority: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when description has more than 100 characters' do
      expect(build(:assignment, description: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:assignment, notes: 'a' * 1001)).to_not be_valid
    end
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
