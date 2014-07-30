def admin_sample(admin_1, admin_2)
  [admin_1.id, admin_1.id, admin_2.id].sample
end

def boolean_sample
  [true, true, false].sample
end

def random_street_number
  rand(10..9999)
end

def random_phone_number
  rand(1111111111..9999999999).to_s
end

def road_type_sample
  %w(St. Blvd. Ave.).sample
end

def city_sample
  %w(Greenville Washington Franklin Fairview Springfield Dongan).sample
end

def datetime_sample
  rand(2.years).ago
end

def composed_street_address
  "#{random_street_number} #{Faker::Name.last_name} #{road_type_sample}"
end

User.destroy_all

User.create!(handle: 'demo_user', password: 'harmonize',
  password_confirmation: 'harmonize', admin: false)

demo_admin = User.create!(handle: 'demo_admin', first_name: 'Phil', admin: true,
  last_name: 'Collins', password: 'harmonize', password_confirmation: 'harmonize')

hlnews = User.create!(handle: 'hlnews', first_name: 'Huey', last_name: 'Lewis',
  password: 'harmonize', password_confirmation: 'harmonize', admin: true)

demo_admin.save!
hlnews.save!

Account.destroy_all
Address.destroy_all

40.times do
  account = Account.create!(name: Faker::Company.name, active: boolean_sample,
    website: Faker::Internet.domain_name, created_at: datetime_sample,
    user_id: admin_sample(demo_admin, hlnews))

  account.save!

  Address.create!(street_1: composed_street_address, city: city_sample,
    state: Faker::AddressUS.state_abbr, postal_code: Faker::AddressUS.zip_code,
    country: 'US', type: 'BillingAddress', addressable_type: 'Account',
    addressable_id: account.id)
end

70.times do
  contact = Contact.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, company: Faker::Company.name,
    created_at: datetime_sample, user_id: admin_sample(demo_admin, hlnews))

  contact.save!

  Phone.create!(mobile: random_phone_number, office: random_phone_number,
    phoneable_id: contact.id, phoneable_type: 'Contact')
end
