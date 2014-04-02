require 'spec_helper'

describe Task do

  describe 'description' do
    it 'is invalid when description not provided' do
      expect(build(:task, description: nil)).to_not be_valid
    end
  end
end
