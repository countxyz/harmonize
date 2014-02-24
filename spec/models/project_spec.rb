require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create :project }

  describe 'empty fields' do
    it 'is invalid when name is not provided' do
      expect(build(:project, name: nil)).to_not be_valid
    end

    it 'is invalid when status is not provided' do
      expect(build(:project, status: nil)).to_not be_valid
    end

    it 'is invalid when priority is not provided' do
      expect(build(:project, priority: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when name has more than 50 characters' do
      expect(build(:project, name: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when role has more than 100 characters' do
      expect(build(:project, role: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:project, notes: 'a' * 1001)).to_not be_valid
    end
  end

  describe 'valid entries' do
    it "is valid when status is 'Not Started', 'In Progress', 'Completed'" do
      valid_statuses = ['Not Started', 'In Progress', 'Completed']
      valid_statuses.each do |valid_status|
        expect(build(:project, status: valid_status)).to be_valid
      end
    end

    it "is valid when priority is N/A', 'Low', 'High', 'Urgent'" do
      valid_priorities = %w[Low High Urgent N/A]
      valid_priorities.each do |valid_priority|
        expect(build(:project, priority: valid_priority)).to be_valid
      end
    end
  end

  describe 'invalid dates' do
    it 'cannot have a target date before start date' do
      project = build(:project, start_date: '2013-11-02', target_date: '2013-11-01')
      expect(project).to_not be_valid
    end

    it 'cannot have a deadline before start date' do
      project = build(:project, start_date: '2013-11-02', deadline: '2013-11-01')
      expect(project).to_not be_valid
  end

    it 'cannot be a date before start date' do
      project = build(:project, start_date: '2013-11-02',
                                completion_date: '2013-11-01')
      expect(project).to_not be_valid
    end
  end
end
