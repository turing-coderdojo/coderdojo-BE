module Mutations
  class SignIn < Mutations::BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(username: nil, password: nil)
      user = User.find_by!(username: username)
      return {} unless user
      return {} unless user.password == password

      token = Base64.encode64(user.username)
      {
        token: token,
        user: user
      }
    end
  end
end
