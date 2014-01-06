FactoryGirl.define do
  factory :event do
    title 'MyString'
    description 'MyText'
    start_time '2013-12-24 04:52:02'
    end_time '2013-12-24 05:52:02'
    all_day false
  end

  factory :no_dates, class: Event do
    title 'No Dates'
    description 'I have no dates'
  end
end
