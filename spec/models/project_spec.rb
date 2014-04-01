require 'spec_helper'

describe Project do
  
  it 'counts assignments per project' do
    two_assignments = create(:project_with_assignments)
    expect(two_assignments.assignment_total).to eq 2
  end


  # TODO: issues with FactoryGirl has_many associations
  # it 'counts unfinished assignments per project' do
  #   two_unfinished_assignments = create(:project_with_assignments)
  #   expect(two_unfinished_assignments.unfinished_assignments_total).to eq 2
  # end
  
  describe 'uniqueness' do
    it 'is invalid when name is used more than once' do
      project_1 = create(:project)
      project_2 = project_1.dup
      expect(project_2).to_not be_valid
    end
  end

  describe 'empty fields' do
    it 'is invalid when name is not provided' do
      expect(build(:project, name: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when name has more than 50 characters' do
      expect(build(:project, name: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when employer has more than 50 characters' do
      expect(build(:project, employer: 'a' * 51)).to_not be_valid
    end

    it 'is invalid when website has more than 100 characters' do
      expect(build(:project, website: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when github has more than 100 characters' do
      expect(build(:project, github: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:project, notes: 'a' * 1001)).to_not be_valid
    end
  end

  describe 'assignments' do
    before(:each) do
      @project = create(:project) do |project|
        project.assignments.create(attributes_for(:assignment))
      end
    end

    it 'has assignment' do
      expect(@project.assignments.count).to eq 1
    end

    it 'adds assignment to assignments' do
      @assignment = create(:another_assignment)
      @project.add_assignment(@project, @assignment)
      expect(@project.assignments.count).to eq 2
    end
  end
end
