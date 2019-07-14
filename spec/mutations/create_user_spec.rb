require 'rails_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  describe 'GraphQL User mutations' do
    def perform(user: nil, **args)
      Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
    end

    it 'create a new user' do
      user = perform(
        nickname: 'Duce',
        role: 0,
        password: 'password'
      )

      assert user.persisted?
      assert_equal user.nickname, 'Duce'
      assert_equal user.password, 'password'
      assert_equal user.role, 0
    end
  end
end
