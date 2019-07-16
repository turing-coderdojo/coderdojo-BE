module Mutations
  class CreateUser < Mutations::BaseMutation
    #User args
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
    argument :phone_number, String, required: true
    #Address args
    argument :street_1, String, required: true
    argument :street_2, String, required: false
    argument :city, String, required: true
    argument :state, String, required: true
    argument :zip, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(email: nil,
             username: nil,
             password: nil,
                 name: nil,
         phone_number: nil,
             street_1: nil,
             street_2: nil,
                 city: nil,
                state: nil,
                  zip: nil)

      user = User.create!(
        email: email,
        username: username,
        password: password,
        role: 1,
        name: name,
        phone_number: phone_number)

      address = user.addresses.create!(
        street_1: street_1,
        street_2: street_2,
            city: city,
           state: state,
             zip: zip)
             
      return user
    end
  end
end
