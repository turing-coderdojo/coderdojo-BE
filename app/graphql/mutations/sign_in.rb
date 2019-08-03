module Mutations
  class SignIn < Mutations::BaseMutation
    argument :username, String, required: false
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(username: nil, password: nil)

      user = User.find_by(email: username)
      if !user
        user = User.find_by(username: username)
      end

      return GraphQL::ExecutionError.new("Invalid Email/Username!") unless user
      return GraphQL::ExecutionError.new("Invalid Password!") unless user.authenticate(password)

      token = Base64.encode64(user.username)
      {
        token: token,
        user: user
      }
    end
  end
end
