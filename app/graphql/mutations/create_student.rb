module Mutations
  class CreateStudent < Mutations::BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
    argument :birthdate, String, required: true
    # return type from the mutation
    type Types::UserType

    def resolve(username: nil,
            password: nil,
                name: nil,
         birthdate: nil)

      if context[:current_user] && (context[:current_user][:role] >= 1)
        User.create!(
          username: username,
          password: password,
              role: 0,
              name: name,
         birthdate: birthdate,
       guardian_id: context[:current_user][:id])
      elsif context[:current_user]
        GraphQL::ExecutionError.new("Students cannot create students!")
      else
       User.create!(
         username: username,
         password: password,
             role: 0,
             name: name,
        birthdate: birthdate)
      end
   end
  end
end
