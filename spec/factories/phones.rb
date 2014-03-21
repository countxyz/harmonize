require 'faker'

FactoryGirl.define do
  factory :phone do
    association :contact
    office '2125555555'
    mobile { Faker::PhoneNumber.phone_number }
    fax    { Faker::PhoneNumber.phone_number }
    home   { Faker::PhoneNumber.phone_number }
  end

  factory :other_phone, class: Phone do
    association :other_contact
    office '2125555555'
  end
end
