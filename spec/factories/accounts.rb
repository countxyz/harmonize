FactoryGirl.define do
  factory :account do
    name        'IniTech'
    created_at  { 2.days.ago }
    association :user
  end
end
