Project.delete_all

Project.create!(name: 'Harmonize',     notes: 'Ambitious target date.')
Project.create!(name: 'Vandalay',      notes: 'Bring your A game with Vandalay')
Project.create!(name: 'MastaMindzLLC', notes: 'Client satisfied.')

Contact.delete_all

contact_1 = Contact.create!(first_name: 'Art', last_name: 'Vandalay',
                            email: 'artvandalay@vandalayindustries.com',
                            secondary_email: 'artshizzle@gmail.com',
                            notes: 'Arty is on it 24-7.')

contact_2 = Contact.create!(first_name: 'Eleanor', last_name: 'Rigby',
                            email: 'erigby@applestudios.com',
                            notes: 'No calls after 9.')

contact_3 = Contact.create!(first_name: 'Bill', last_name: 'Burr',
                            email: 'redface@billburr.com',
                            notes: 'Stay on top of this')

Phone.delete_all

Phone.create!(contact: contact_1, office: '2125555555', mobile: '9175555555',
              fax: '2125555556', home: '7185555555')

Phone.create!(contact: contact_2, office:  '2125555555', fax:     '2125555556')

Phone.create!(contact: contact_3,
              mobile:  '9175555555',
              home:    '7185555555')

Event.create!(title: 'Harmonize', description: 'Add contact model',
  start_time: '2014-01-12 01:00:00', end_time: '2014-01-14 01:00:00',
  all_day: true)

Event.create!(title: 'Vandalay', description: 'Create Prototype',
  start_time: '2014-01-06 01:00:00', end_time: '2014-01-16 01:00:00',
  all_day: true)
