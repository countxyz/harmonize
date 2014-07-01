require 'rails_helper'

describe TasksHelper do

  describe 'Datetime Format' do
    it "is labeled with 'No Deadline' when datetime not given" do
      datetime = nil
      expect(helper.task_datetime_format datetime).to eql 'No Deadline'
    end

    it 'formats datetime when given' do
      datetime = DateTime.new(2014, 7, 31, 9, 0, 0)
      expect(helper.task_datetime_format datetime).to be
        'July 31, 2014 9:00 am EDT'
    end
  end
end