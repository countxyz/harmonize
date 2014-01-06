# Project data

Project.delete_all

Project.create!(name: 'Harmonize',
                role: 'Add contact model',
                status: 'Not Started',
                priority: 'High',
                start_date: '2014-01-12',
                target_date: '2014-01-14',
                deadline: '2014-01-18',
                notes: 'Ambitious target date, but try to finish by the end of
                       the week')

Project.create!(name: 'Vandalay',
                role: 'Create Prototype',
                status: 'In Progress',
                priority: 'High',
                start_date: '2014-01-06',
                target_date: '2014-01-16',
                deadline: '2014-01-25',
                notes: 'Bring your A game with Vandalay')

Project.create!(name: 'MastaMindzLLC',
                role: 'Site',
                status: 'Completed',
                priority: 'N/A',
                start_date: '2013-05-01',
                completion_date: '2013-05-15',
                notes: 'Completed mid-May. Client very satisfied')

Project.create!(name: 'Beneke Financials',
               role: 'Tshoot customer view',
               status: 'In Progress',
               priority: 'Urgent',
               start_date: '2014-01-02',
               target_date: '2014-01-12',
               deadline: '2014-01-15',
               notes: 'Need to wrap up this week.')

Project.create!(name: 'Bill Burr',
                role: 'Redo show listings',
                status: 'Not Started',
                priority: 'High',
                target_date: '2014-01-12',
                deadline: '2014-01-15',
                notes: "Bill says this isn't too important, but for Bill, 
                       all priorities start at High")

Project.create!(name: 'MastaMindzLLC',
                role: 'Update site content',
                status: 'Not Started',
                priority: 'Low',
                target_date: '2014-01-25',
                notes: 'Client has no rush. Whenever I get around to it.')

# Contact data

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
                            notes: "Make sure you stay on top of his tour
                                    schedule. It's a lot harder to get in
                                    contact with him when he's away.")

contact_4 = Contact.create!(first_name: 'Thurston', last_name: 'Howell',
                            email: 'tHowellIII@gilliganisle.com')

# Phone data

Phone.delete_all

Phone.create!(contact: contact_1,
              office:  '2125555555',
              mobile:  '9175555555',
              fax:     '2125555556',
              home:    '7185555555')

Phone.create!(contact: contact_2,
              office:  '2125555555',
              fax:     '2125555556')

Phone.create!(contact: contact_3,
              mobile:  '9175555555',
              home:    '7185555555')

Phone.create!(contact: contact_4,
              fax:     '2125555555',
              home:    '7185555555')

# Event Data

Event.create!(title: 'Harmonize', description: 'Add contact model',
  start_time: '2014-01-12 01:00:00', end_time: '2014-01-14 01:00:00',
  all_day: true)

Event.create!(title: 'Vandalay', description: 'Create Prototype',
  start_time: '2014-01-06 01:00:00', end_time: '2014-01-16 01:00:00',
  all_day: true)

Event.create!(title: 'Beneke Financials', description: 'Tshoot customer view',
  start_time: '2014-01-02 01:00:00', end_time: '2014-01-12 01:00:00',
  all_day: true)

Event.create!(title: 'Bill Burr', description: 'Redo show listings',
  start_time: '2014-01-16 01:00:00', end_time: '2014-01-26 01:00:00',
  all_day: true)
