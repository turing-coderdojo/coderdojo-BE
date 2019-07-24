module Mutations
  class UpdateUser < Mutations::BaseMutation
    #User args
    argument :id, String, required: false
    argument :email, String, required: false
    argument :username, String, required: false
    argument :password, String, required: false
    argument :name, String, required: false
    argument :phone_number, String, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(id: nil,
             email: nil,
          username: nil,
          password: nil,
              name: nil,
      phone_number: nil,
         birthdate: nil)

      current_user = context[:current_user]
      student = User.find(id)

      student_params = {birthdate: birthdate,
        username: username,
        password: password,
        name: name}

      user_params = {email: email,
          username: username,
          password: password,
          name: name,
          phone_number: phone_number}

      if current_user.guardian_id
        GraphQL::ExecutionError.new("Not Authorized to update!")
      elsif (current_user.role == 0) || current_user.students.includes?(student)
        student.update(student_params)
        user = student
      else
        current_user.update(user_params)
        user = current_user
      end

      token = Base64.encode64(user.username)
      {
        token: token,
        user: user
      }
    end

  end
end
