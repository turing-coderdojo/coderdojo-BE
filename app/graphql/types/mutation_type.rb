module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :sign_in, mutation: Mutations::SignIn
    field :create_student, mutation: Mutations::CreateStudent
    field :create_venue, mutation: Mutations::CreateVenue
    field :create_venue_admin, mutation: Mutations::CreateVenueAdmin
    field :create_event, mutation: Mutations::CreateEvent
    field :update_event, mutation: Mutations::UpdateEvent
    field :delete_event, mutation: Mutations::DeleteEvent
    field :log_attendance, mutation: Mutations::LogAttendance
  end
end
