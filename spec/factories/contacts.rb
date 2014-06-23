FactoryGirl.define do
  factory :contact do
    first_name  'Art'
    association :user
  end
end
