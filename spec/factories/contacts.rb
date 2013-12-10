require 'faker'

FactoryGirl.define do
  factory :contact do
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    email           { Faker::Internet.email }
    secondary_email { Faker::Internet.email }

    after(:build) do |contact|
      FactoryGirl.create(:phone, contact: contact)
    end
  end

  factory :other_contact, class: Contact do
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    email           { Faker::Internet.email }
    secondary_email { Faker::Internet.email }

    after(:build) do |other_contact|
      FactoryGirl.create(:phone, contact: other_contact)
    end
  end

  factory :just_contact, class: Contact do
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    email           { Faker::Internet.email }
    secondary_email { Faker::Internet.email }
  end
end
