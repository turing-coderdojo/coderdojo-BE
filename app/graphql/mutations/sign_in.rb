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


      prng = Random.new
      unless user
        sleep prng.rand(1000)/1000
        return GraphQL::ExecutionError.new("Invalid credentials")
      end

      unless user.authenticate(password)
        sleep prng.rand(1000)/1000
        return GraphQL::ExecutionError.new("Invalid credentials")
      end
      
      token = Base64.encode64(user.username)
      {
        token: token,
        user: user
      }
    end
  end
end
