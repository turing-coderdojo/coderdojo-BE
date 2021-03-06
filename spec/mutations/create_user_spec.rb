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
        street1: '123 main',
        city: 'Denver',
        state: 'CO',
        zip: '80128'
      )

      assert user.persisted?
      assert_equal user.username, 'duce'
      assert_equal user.password, 'password'
      assert_equal user.addresses[0].city, 'denver'
    end
  end
end
