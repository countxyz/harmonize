# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    contact_id 1
    mobile "MyString"
    office "MyString"
    voip "MyString"
    fax "MyString"
    home "MyString"
  end
end
