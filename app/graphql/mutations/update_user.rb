module Mutations
  class UpdateUser < Mutations::BaseMutation
    #User args
    argument :id, Integer, required: false
    argument :email, String, required: false
    argument :username, String, required: false
    argument :password, String, required: false
    argument :name, String, required: false
    argument :phone_number, String, required: false
    argument :birthdate, String, required: false

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

      if id
        student = User.find(id)
      elsif current_user.role == 0
        student = current_user
      end

      student_params = {birthdate: birthdate,
        username: username,
        password: password,
        name: name,
        role: 0}

      user_params = {email: email,
          username: username,
          password: password,
          name: name,
          phone_number: phone_number}

      if current_user.guardian_id != nil
        GraphQL::ExecutionError.new("Not Authorized to update!")
      elsif student || current_user.students.include?(student)
        student.update(student_params)
        user = student
        token = Base64.encode64(user.username)
        {
          token: token,
          user: user
        }
      else
        current_user.update(user_params)
        user = current_user
        token = Base64.encode64(user.username)
        {
          token: token,
          user: user
        }
      end

    end

  end
end
