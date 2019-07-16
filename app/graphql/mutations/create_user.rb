module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: false
    argument :nickname, String, required: true
    argument :password, String, required: true
    argument :role, Integer, required: true
    argument :name, String, required: false
    argument :phone_number, String, required: false
    argument :guardian_id, Integer, required:false
    # return type from the mutation
   type Types::UserType

   def resolve(email: nil,
            nickname: nil,
            password: nil,
                role: nil,
                name: nil,
        phone_number: nil,
         guardian_id: nil)

     User.create!(
          email: email,
       nickname: nickname,
       password: password,
           role: role,
           name: name,
   phone_number: phone_number,
    guardian_id: guardian_id
     )
   end
  end
end
