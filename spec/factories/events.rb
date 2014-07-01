FactoryGirl.define do
  factory :event do
    name        'Meeting'
    description 'Boring'
    start       { 1.hour.from_now.to_s  }
    finish      { 2.hours.from_now.to_s }
    association :user
  end
end
