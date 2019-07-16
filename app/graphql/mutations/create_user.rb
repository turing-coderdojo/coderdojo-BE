module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
    argument :phone_number, String, required: true
    # return type from the mutation
    type Types::UserType

    def resolve(email: nil,
            username: nil,
            password: nil,
                name: nil,
        phone_number: nil)

      User.create!(
           email: email,
        username: username,
        password: password,
            role: 1,
            name: name,
    phone_number: phone_number)
    end
  end
end
