# Project data

Project.delete_all

Project.create!(name: "Harmonize",
                role: "Add contact model",
                status: "Not Started",
                priority: "High",
                start_date: "11/12/2013",
                target_date: "11/14/2013",
                deadline: "11/18/2013",
                notes: "Ambitious target date, but try to finish by the end of
                       the week")

Project.create!(name: "Vandelay",
                role: "Create Prototype",
                status: "In Progress",
                priority: "High",
                start_date: "11/06/2013",
                target_date: "11/16/2013",
                deadline: "11/25/2013",
                notes: "Bring your A game with Vandelay")

Project.create!(name: "MastaMindzLLC",
                role: "Site",
                status: "Completed",
                priority: "N/A",
                start_date: "05/01/2013",
                completion_date: "05/15/2013",
                notes: "Completed mid-May. Client very satisfied")

Project.create!(name: "Beneke Financials",
               role: "Tshoot customer view",
               status: "In Progress",
               priority: "Urgent",
               start_date: "11/02/2013",
               target_date: "11/12/2013",
               deadline: "11/15/2013",
               notes: "Need to wrap up this week.")

Project.create!(name: "Bill Burr",
                role: "Redo show listings",
                status: "Not Started",
                priority: "High",
                target_date: "12/12/2013",
                deadline: "12/15/2013",
                notes: "Bill says this isn't too important, but for Bill, 
                       all priorities start at High")

Project.create!(name: "MastaMindzLLC",
                role: "Update site content",
                status: "Not Started",
                priority: "Low",
                target_date: "01/15/2014",
                notes: "Client has no rush. Whenever I get around to it.")

# Contact data

Contact.delete_all

contact_1 = Contact.create!(first_name: "Art", last_name: "Vandelay",
                            email: "artvandalay@vandelayindustries.com")

contact_2 = Contact.create!(first_name: "Eleanor", last_name: "Rigby",
                            email: "erigby@applestudios.com")

contact_3 = Contact.create!(first_name: "Bill", last_name: "Burr",
                            email: "redface@billburr.com")

#Phone data

Phone.delete_all

Phone.create!(contact: contact_1,
              office:  "2125555555",
              mobile:  "9175555555",
              fax:     "2125555556",
              home:    "7185555555")

Phone.create!(contact: contact_2,
              office:  "2125555555",
              fax:     "2125555556")

Phone.create!(contact: contact_3,
              mobile:  "9175555555",
              home:    "7185555555")
