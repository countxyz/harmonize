User.destroy_all

User.create!(handle:                'demo_user',
             password:              'harmonize',
             password_confirmation: 'harmonize',
             admin:                 false)

demo_admin = User.create!(handle:                'demo_admin',
                          first_name:            'Phil',
                          last_name:             'Collins',
                          password:              'harmonize',
                          password_confirmation: 'harmonize',
                          admin:                 true)

hlnews =     User.create!(handle:                'hlnews',
                          first_name:            'Huey',
                          last_name:             'Lewis',
                          password:              'harmonize',
                          password_confirmation: 'harmonize',
                          admin:                 true)

demo_admin.save!
hlnews.save!

Account.destroy_all

random_admin = [demo_admin.id, hlnews.id].sample
random_boolean = [true, false].sample

40.times do
  Account.create!(
    name: Faker::Company.name,
    active: random_boolean,
    user_id: random_admin)
end
