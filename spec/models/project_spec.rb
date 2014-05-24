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
  
  describe 'associations' do
    it { should have_many(:assignments) }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:name) }
  end

  describe 'presence' do
    it { should validate_presence_of(:name) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:name).is_at_most(50)                    }
    it { should ensure_length_of(:employer).is_at_most(50)                }
    it { should ensure_length_of(:website).is_at_least(4).is_at_most(100) }
    it { should ensure_length_of(:github).is_at_least(12).is_at_most(100) }
    it { should ensure_length_of(:notes).is_at_most(1000)                 }
  end
end
