module Types
  class MutationType < Types::BaseObject

    field :create_user, mutation: Mutations::CreateUser
    field :sign_in, mutation: Mutations::SignIn
    field :create_student, mutation: Mutations::CreateStudent
    field :create_venue, mutation: Mutations::CreateVenue
  end
end
