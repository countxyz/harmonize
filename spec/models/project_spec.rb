require 'spec_helper'

describe Project do

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

    it 'is invalid when notes has more than 1000 characters' do
      expect(build(:project, notes: 'a' * 1001)).to_not be_valid
    end
  end
end
