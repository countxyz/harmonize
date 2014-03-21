require 'spec_helper'

describe Event do

  describe 'empty fields' do
    it 'is invalid when title is not provided' do
      expect(build(:event, title: nil)).to_not be_valid
    end

    it 'is invalid when description is not provided' do
      expect(build(:event, description: nil)).to_not be_valid
    end

    it 'is invalid when start_time is not provided' do
      expect(build(:no_dates)).to_not be_valid
    end

    it 'is invalid when end_time is not provided' do
      expect(build(:no_dates)).to_not be_valid
    end

    it 'is invalid when all_day is not provided' do
      expect(build(:no_dates)).to_not be_valid
    end
  end

  describe 'invalid dates' do
    it 'cannot have an end_time before start_time' do
      event = build(:event, start_time: '2014-01-24 01:00:00', 
                            end_time: '2014-01-23 01:00:00')
      expect(event).to_not be_valid
    end
  end
end
