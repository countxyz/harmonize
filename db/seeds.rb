# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
Project.delete_all

Project.create(name: "Harmonize",
               role: "Add contact model",
               status: "Not Started",
               priority: "High",
               start_date: "2013-11-12",
               target_date: "2013-11-14",
               deadline: "2013-11-18",
               notes: "Ambitious target date, but try to finish by the end of
                       the week")

Project.create(name: "Vandelay",
               role: "Create Prototype",
               status: "In Progress",
               priority: "High",
               start_date: "2013-11-06",
               target_date: "2013-11-16",
               deadline: "2013-11-25",
               notes: "Bring your A game with Vandelay")

Project.create(name: "MastaMindzLLC",
               role: "Site",
               status: "Completed",
               priority: "N/A",
               start_date: "2013-05-01",
               completion_date: "2013-05-15",
               notes: "Completed mid-May. Client very satisfied")

Project.create(name: "Beneke Financials",
               role: "Tshoot customer view",
               status: "In Progress",
               priority: "Urgent",
               start_date: "2013-11-02",
               target_date: "2013-11-12",
               deadline: "2013-11-15",
               notes: "Need to wrap up this week.")

Project.create(name: "Bill Burr",
               role: "Redo show listings",
               status: "Not Started",
               priority: "High",
               target_date: "2013-11-21",
               deadline: "2013-12-15",
               notes: "Bill says this isn't too important, but for Bill, 
                       all priorities start at High")

Project.create(name: "MastaMindzLLC",
               role: "Update site content",
               status: "Not Started",
               priority: "Low",
               target_date: "2013-12-15",
               notes: "Client has no rush. Whenever I get around to it.")