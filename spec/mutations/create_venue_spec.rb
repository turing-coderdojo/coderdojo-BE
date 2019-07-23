require 'rails_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  describe 'GraphQL User mutations' do
    def perform_superuser(venue: nil, **args)
      Mutations::CreateVenue.new(object: nil, context: {current_user:{role: 3}}).resolve(args)
    end

    def perform_other_user(venue: nil, **args)
      Mutations::CreateVenue.new(object: nil, context: {current_user:{role: 2}}).resolve(args)
    end

    it 'create a new venue' do

      venue = perform_superuser(
        name: 'Venue One',
        street1: '123 main',
        city: 'Denver',
        state: 'CO',
        zip: '80128'
      )

      assert venue.persisted?
      assert_equal venue.name, 'Venue One'
      assert_equal venue.addresses[0].city, 'denver'
    end

    it 'throws error when current user is not superuser' do
      venue = perform_other_user(
        name: 'Venue One',
        street1: '123 main',
        city: 'Denver',
        state: 'CO',
        zip: '80128'
      )

      assert_equal venue.class, GraphQL::ExecutionError
    end
  end
end
