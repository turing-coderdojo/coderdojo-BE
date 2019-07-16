module Mutations
  class CreateStudent < Mutations::BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true
    argument :name, String, required: false
    # return type from the mutation
    type Types::UserType

    def resolve(nickname: nil,
            password: nil,
                name: nil,
         birthdate: nil)

      if context[:current_user].nil?
        raise GraphQL::ExecutionError,
        "You need to authenticate to perform this action"
      end

      User.create!(
        nickname: nickname,
        password: password,
            role: role,
            name: name,
     guardian_id: context[:current_user][:id])
   end
  end
end
