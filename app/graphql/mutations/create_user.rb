module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :email, String, required: false
    argument :nickname, String, required: true
    argument :password, String, required: true
    argument :role, Integer, required: true
    argument :name, String, required: false
    argument :phone_number, String, required: false
    # return type from the mutation
   type Types::UserType

   def resolve(email: nil,
            nickname: nil,
            password: nil,
                role: nil,
                name: nil,
        phone_number: nil)

     User.create!(
          email: email,
       nickname: nickname,
       password: password,
           role: role,
           name: name,
   phone_number: phone_number,
     )
   end
  end
end
