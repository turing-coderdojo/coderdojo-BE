module Mutations
  class DeleteEvent < Mutations::BaseMutation
    argument :id, Integer, required: true

    type Types::EventType

    def resolve(id:nil)
      current_user = context[:current_user]
      event = Event.find(id)
      venue = event.venue
      if (current_user && current_user.is_venue_admin?(venue.id)) ||
        (current_user && (current_user[:role] == 3))
        if event.addresses
          event.addresses.destroy_all
        end
        event.destroy
      else
        GraphQL::ExecutionError.new("Not authorized to delete event!")
      end
    end
  end
end
