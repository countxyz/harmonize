require 'spec_helper'

describe Assignment do
  let(:project) { FactoryGirl.create :project }

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

  describe 'valid entries' do
    it "is valid when status is 'Not Started', 'In Progress', 'Completed'" do
      valid_statuses = ['Not Started', 'In Progress', 'Completed']
      valid_statuses.each do |valid_status|
        expect(build(:assignment, status: valid_status)).to be_valid
      end
    end
  end
end
