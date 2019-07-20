# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


superuser_1 = User.create(name: "Superuser One", username: "superuser1", email: "example@superuser1.com", password: "password", role: 3, phone_number: "5555555553")
admin_1 = User.create(name: "Admin One", username: "admin1", email: "example@admin1.com", password: "password", role: 1, phone_number: "5555555553")
admin_2 = User.create(name: "Admin Two", username: "admin2", email: "example@admin2.com", password: "password", role: 1, phone_number: "5555555515")
admin_3 = User.create(name: "Admin Three", username: "admin3", email: "example@admin3.com", password: "password", role: 1, phone_number: "5555555525")
user_1 = User.create(name: "Matt Weiss", username: "Duce", email: "weiss.matt@outlook.com", password: "password", role: 1, phone_number: "5555555555")

student_1 = User.create(name: "Student One", username: "student1", email: "example@student.com", password: "password", role: 0, birthdate: "Jan 1, 2005", guardian_id: user_1.id)
student_2 = User.create(name: "Student Two", username: "student2", email: "example2@student2.com", password: "password", role: 0, birthdate: "Jan 1, 2006", guardian_id: user_1.id)

student_3 = User.create(name: "Student Three", username: "student3", email: "example3@student3.com", password: "password", role: 0, birthdate: "Jan 1, 2007", guardian_id: admin_1.id)
student_4 = User.create(name: "Student Four", username: "student4", email: "example4@student4.com", password: "password", role: 0, birthdate: "Jan 1, 2008", guardian_id: admin_1.id)
student_5 = User.create(name: "Student Five", username: "student5", email: "example5@student5.com", password: "password", role: 0, birthdate: "Jan 1, 2009", guardian_id: admin_1.id)

venue_1 = Venue.create(name: "Venue One", notes: "Here be Dragons", email: "example@venue.com", web_url: "www.venueone.com")
venue_2 = Venue.create(name: "Venue Two", email: "example@venue2.com", web_url: "www.venuetwo.com")
venue_3 = Venue.create(name: "Venue Three", notes: "This basement has no windows", email: "example@venue3.com", web_url: "www.venuethree.com")

user_1.addresses.create(street_1: "123 Main St.", street_2: "Apt 345", city: "Denver", state: "CO", zip: "80128")
admin_1.addresses.create(street_1: "234 Main St.", street_2: "Apt 456", city: "Denver", state: "CO", zip: "80128")
superuser_1.addresses.create(street_1: "456 Main St.", street_2: "Apt 567", city: "Denver", state: "CO", zip: "80128")
venue_1.addresses.create(street_1: "567 Main St.", street_2: "Apt 678", city: "Denver", state: "CO", zip: "80128")
venue_2.addresses.create(street_1: "567 Main St.", street_2: "Apt 678", city: "Denver", state: "CO", zip: "80128")
venue_3.addresses.create(street_1: "567 Main St.", street_2: "Apt 678", city: "Denver", state: "CO", zip: "80128")

VenueAdmin.create(user_id: admin_1.id, venue_id: venue_1.id)
VenueAdmin.create(user_id: admin_2.id, venue_id: venue_2.id)
VenueAdmin.create(user_id: admin_2.id, venue_id: venue_3.id)
VenueAdmin.create(user_id: admin_3.id, venue_id: venue_3.id)

event_1 = venue_2.events.create(name: "Test Event 1", start_time: '2019-07-19 17:00:00', end_time: '2019-07-19 18:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))
event_2 = venue_1.events.create(name: "Test Event 2", start_time: '2019-07-20 17:00:00', end_time: '2019-07-20 18:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))
event_3 = venue_1.events.create(name: "Test Event 3", start_time: '2019-07-20 19:00:00', end_time: '2019-07-20 20:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))
event_4 = venue_1.events.create(name: "Test Event 4", start_time: '2019-07-18 19:00:00', end_time: '2019-07-18 20:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))
event_5 = venue_1.events.create(name: "Test Event 5", start_time: '2019-07-17 19:00:00', end_time: '2019-07-17 20:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))
event_6 = venue_1.events.create(name: "Test Event 6", start_time: '2019-07-16 19:00:00', end_time: '2019-07-16 20:00:00', notes: "testing notes", event_code: SecureRandom.hex(4))

event_6.addresses.create(street_1: "567 Different St.", street_2: "Apt 678", city: "Denver", state: "CO", zip: "80128")

UserEvent.create(user_id: student_1.id, event_id: event_1.id)
UserEvent.create(user_id: student_2.id, event_id: event_1.id)
UserEvent.create(user_id: student_3.id, event_id: event_1.id)
UserEvent.create(user_id: student_4.id, event_id: event_1.id)
UserEvent.create(user_id: student_5.id, event_id: event_1.id)
UserEvent.create(user_id: student_1.id, event_id: event_2.id)
UserEvent.create(user_id: student_1.id, event_id: event_3.id)
UserEvent.create(user_id: student_2.id, event_id: event_2.id)
UserEvent.create(user_id: student_2.id, event_id: event_3.id)
UserEvent.create(user_id: student_3.id, event_id: event_3.id)
UserEvent.create(user_id: student_4.id, event_id: event_4.id)
