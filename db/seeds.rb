def boolean_sample
  [true, true, false].sample
end

def street_number_sample
  Random.new.rand(10..9999)
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
  "#{street_number_sample} #{Faker::Name.last_name} #{road_type_sample}"
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
    user_id: [demo_admin.id, demo_admin.id, hlnews.id].sample)

  account.save!

  Address.create!(street_1: composed_street_address, city: city_sample,
    state: Faker::AddressUS.state_abbr, postal_code: Faker::AddressUS.zip_code,
    country: 'US', type: 'BillingAddress', addressable_type: 'Account',
    addressable_id: account.id)
end
