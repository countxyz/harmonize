# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_series do
    frequency 1
    period "MyString"
    starttime "2013-12-24 05:28:28"
    endtime "2013-12-24 05:28:28"
    all_day false
  end
end
