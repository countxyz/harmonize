require 'spec_helper'

describe Task do
  it 'falls into No Dealine catagory without a date' do
    @no_deadline = create(:task)
    expect(Task.no_deadline).to eq [@no_deadline]
  end

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