FactoryGirl.define do
  factory :phone do
    association :contact
    contact_id 1
    mobile "917-555-5555"
    office "212-555-5555"
    voip "MyString"
    fax "718-555-5555"
    home "516-555-5555"
  end
end
