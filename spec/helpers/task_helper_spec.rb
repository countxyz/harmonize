require 'rails_helper'

describe TasksHelper do

  describe 'Datetime Format' do
    it "is labeled with 'No Deadline' when datetime not given" do
      datetime = nil
      expect(helper.datetime_format datetime).to eql 'No Deadline'
    end

    it 'formats datetime when given' do
      datetime = DateTime.new(2014, 4, 1, 14, 27, 0)
      expect(helper.datetime_format datetime).to eql(
        'April 01, 2014 - Tuesday  2:27 pm +00:00')
    end
  end
end
