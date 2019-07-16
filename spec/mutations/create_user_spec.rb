require 'rails_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  describe 'GraphQL User mutations' do
    def perform(user: nil, **args)
      Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
    end

    it 'create a new user' do
      user = perform(
        name: 'Matt W',
        username: 'Duce',
        password: 'password',
        street_1: '123 main',
        city: 'Denver',
        state: 'CO',
        zip: '80128'
      )

      assert user.persisted?
      assert_equal user.username, 'Duce'
      assert_equal user.password, 'password'
      assert_equal user.addresses[0].city, 'Denver'
    end
  end
end
