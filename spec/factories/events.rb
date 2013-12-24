# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    starttime "2013-12-24 04:52:02"
    endtime "2013-12-24 04:52:02"
    all_day false
    description "MyText"
  end
end
