require 'rails_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  describe 'GraphQL User mutations' do
    def perform(user: nil, **args)
      Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
    end

    it 'create a new user' do
      user = perform(
        nickname: 'Duce',
        password: 'password'
      )

      assert user.persisted?
      assert_equal user.nickname, 'Duce'
      assert_equal user.password, 'password'
    end
  end
end
