# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

Project.create(name: "Harmonize - Add Contact Model",
               status: "Not Started",
               priority: "High",
               start_date: "2013-11-12",
               target_date: "2013-11-14",
               deadline: "2013-11-18",
               completion_date: nil,
               notes: "Ambitious target date, but try to finish by the end of
                       the week")

Project.create(name: "Vandelay - Prototype",
               status: "In Progress",
               priority: "High",
               start_date: "2013-11-06",
               target_date: "2013-11-16",
               deadline: "2013-11-25",
               completion_date: nil,
               notes: "Bring your A game with Vandelay")

Project.create(name: "MastaMindzLLC - site",
               status: "Completed",
               priority: "N/A",
               start_date: "2013-05-01",
               target_date: "N/A",
               deadline: "N/A",
               completion_date: "2013-05-15",
               notes: "Completed mid-May. Client very satisfied")

Project.create(name: "Beneke Financials - Tshoot customer view",
               status: "In Progress",
               priority: "Urgent",
               start_date: "2013-11-02",
               target_date: "2013-11-12",
               deadline: "2013-11-15",
               completion_date: nil,
               notes: "Need to wrap up this week.")

Project.create(name: "Bill Burr - Redo show listings",
               status: "Not Started",
               priority: "High",
               start_date: "N/A",
               target_date: "2013-11-21",
               deadline: "2013-12-15",
               completion_date: nil,
               notes: "Bill says this isn't too important, but for Bill, 
                       all priorities start at High")