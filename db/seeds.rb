# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


superuser_1 = User.create(name: "Superuser One", username: "superuser1", email: "example@superuser1.com", password: "password", role: 3, phone_number: "5555555553")
admin_1 = User.create(name: "Admin One", username: "admin1", email: "example@admin1.com", password: "password", role: 2, phone_number: "5555555553")
user_1 = User.create(name: "Matt Weiss", username: "Duce", email: "weiss.matt@outlook.com", password: "password", role: 1, phone_number: "5555555555")

student_1 = User.create(name: "Student One", username: "student1", email: "example@student.com", password: "password", role: 0, birthdate: "Jan 1, 2005", guardian_id: user_1.id)
student_2 = User.create(name: "Student Two", username: "student2", email: "example2@student2.com", password: "password", role: 0, birthdate: "Jan 1, 2006", guardian_id: user_1.id)

student_3 = User.create(name: "Student Three", username: "student3", email: "example3@student3.com", password: "password", role: 0, birthdate: "Jan 1, 2007", guardian_id: admin_1.id)
student_4 = User.create(name: "Student Four", username: "student4", email: "example4@student4.com", password: "password", role: 0, birthdate: "Jan 1, 2008", guardian_id: admin_1.id)
student_5 = User.create(name: "Student Five", username: "student5", email: "example5@student5.com", password: "password", role: 0, birthdate: "Jan 1, 2009", guardian_id: admin_1.id)

venue_1 = Venue.create(name: "Venue One", notes: "Here be Dragons", email: "example@venue.com", web_url: "www.venueone.com")

user_1.addresses.create(street_1: "123 Main St.", street_2: "Apt 345", city: "Denver", state: "CO", zip: "80128")
admin_1.addresses.create(street_1: "234 Main St.", street_2: "Apt 456", city: "Denver", state: "CO", zip: "80128")
superuser_1.addresses.create(street_1: "456 Main St.", street_2: "Apt 567", city: "Denver", state: "CO", zip: "80128")
venue_1.addresses.create(street_1: "567 Main St.", street_2: "Apt 678", city: "Denver", state: "CO", zip: "80128")
