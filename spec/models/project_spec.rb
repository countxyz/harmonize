require 'spec_helper'

describe Project do
  
  it 'sorts projects in descending order' do
    first_project, last_project = create(:project), create(:last_project)
    expect(Project.list_by_recent).to eq [last_project, first_project]
  end

  it 'counts assignments per project' do
    two_assignments = create(:project_with_assignments)
    expect(two_assignments.assignment_total_for_project).to eq 2
  end
  
  describe 'uniqueness' do
    it 'is invalid when name is used more than once' do
      project_1, project_2 = create(:project)
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

    it 'is invalid when website has fewer than 4 characters' do
      expect(build(:project, website: 'a' * 3)).to_not be_valid
    end

    it 'is invalid when website has more than 100 characters' do
      expect(build(:project, website: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when github has fewer than 12 characters' do
      expect(build(:project, github: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when github has more than 100 characters' do
      expect(build(:project, github: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:project, notes: 'a' * 1001)).to_not be_valid
    end
  end
end
