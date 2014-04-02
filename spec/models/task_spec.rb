require 'spec_helper'

describe Task do

  describe 'description' do
    it 'is invalid when description not provided' do
      expect(build(:task, description: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when description is longer than 50 characters' do
      expect(build(:task, description: 'a' * 51)).to_not be_valid
    end
  end
end
