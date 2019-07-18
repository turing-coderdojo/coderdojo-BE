require 'rails_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  describe 'GraphQL User mutations' do
    def perform(venue: nil, **args)
      Mutations::CreateVenue.new(object: nil, context: {}).resolve(args)
    end

    it 'create a new venue' do
      venue = perform(
        name: 'Venue One',
        street1: '123 main',
        city: 'Denver',
        state: 'CO',
        zip: '80128'
      )

      assert venue.persisted?
      assert_equal venue.name, 'Duce'
      assert_equal venue.addresses[0].city, 'Denver'
    end
  end
end
