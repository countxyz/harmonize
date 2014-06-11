FactoryGirl.define do
  factory :account do
    name        'IniTech'
    association :user
  end
end
