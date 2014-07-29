require 'rails_helper'

describe ApplicationHelper do
  
  describe 'Page Title' do
    it 'displays base title without page title' do
      expect(helper.base_title).to eq 'Harmonize'
    end
    
    it 'displays full title' do
      expect(helper.full_title 'Home').to eq 'Harmonize | Home'
    end
  end

  describe 'Data Format' do
    it "is 'N/A' when data not given" do
      data = ''
      expect(helper.data_format data).to eq 'N/A'
    end
  end

  describe 'Phone Format' do
    it "is 'N/A' when phone not given" do
      phone = ''
      expect(helper.phone_format phone).to eq 'N/A'
    end

    it 'formats phone when given' do
      phone = '5555555555'
      expect(helper.phone_format phone).to eq '(555) 555-5555'
    end
  end

  describe 'Status Format' do
    it "is 'Active' when true" do
      active_status = true
      expect(helper.status_format active_status).to eq 'Active'
    end

    it "is 'Inactive' when false" do
      inactive_status = false
      expect(helper.status_format inactive_status).to eq 'Inactive'
    end
  end

  describe 'Table Row with Inactive Account' do
    it "has a 'danger' class attribute" do
      account = Account.new(active: false)
      expect(helper.inactive_danger_tr(account)).to eq 'danger'
    end
  end

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

  describe 'non-programmer format' do
    it 'displays counter starting from 1' do
      counter = 0
      expect(helper.non_programmer_format(counter)).to eq 1
    end
  end
end
