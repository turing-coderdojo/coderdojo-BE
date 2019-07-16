module Mutations
  class SignIn < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil, password: nil)
      user = User.find_by!(email: email)
      return {} unless user
      return {} unless user.password == password

      token = Base64.encode64(user.email)
      {
        token: token,
        user: user
      }
    end
  end
end
