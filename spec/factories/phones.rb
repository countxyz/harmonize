FactoryGirl.define do
  factory :phone do
    association :contact
    contact_id 1
    office "2125555555"
    mobile "9175555555"
    fax "7185555555"
    home "5165555555"
  end
end
