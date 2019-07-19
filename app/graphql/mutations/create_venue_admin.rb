module Mutations
  class CreateVenueAdmin < Mutations::BaseMutation
    argument :user_id, Integer, required: true
    argument :venue_id, Integer, required: true

    type Types::VenueAdminType

    def resolve(user_id: nil,
               venue_id: nil)

      current_user = context[:current_user]

      if (current_user && current_user.is_venue_admin?(venue_id)) ||
        (current_user && (current_user[:role] == 3))
        VenueAdmin.create(user_id: user_id, venue_id: venue_id)
      else
        GraphQL::ExecutionError.new("Not authorized to promote users!")
      end
    end

    def is_venue_admin?(venue_id)
      VenueAdmin.find_by(user_id: current_user[:id], venue_id: venue_id)
    end
  end
end
