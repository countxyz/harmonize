User.create!(handle:                'demo_user',
             password:              'harmonize',
             password_confirmation: 'harmonize',
             admin:                 false)

User.create!(handle:                'demo_admin',
             password:              'harmonize',
             password_confirmation: 'harmonize',
             admin:                 true)