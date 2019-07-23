module Mutations
  class CreateEvent < Mutations::BaseMutation
    #Event args
    argument :name, String, required: true
    argument :notes, String, required: false
    argument :start_time, String, required: true
    argument :end_time, String, required: true
    argument :venue_id, Integer, required: true
    #Address args
    argument :street_1, String, required: false
    argument :street_2, String, required: false
    argument :city, String, required: false
    argument :state, String, required: false
    argument :zip, String, required: false

    type Types::EventType

    def resolve(name: nil,
               notes: nil,
          start_time: nil,
            end_time: nil,
            venue_id: nil,
             street1: nil,
             street2: nil,
                city: nil,
               state: nil,
                 zip: nil)

      current_user = context[:current_user]

      if (current_user && current_user.is_venue_admin?(venue_id)) ||
        (current_user && (current_user[:role] == 3))
        event = Event.create(name: name,
                            notes: notes,
                       start_time: start_time,
                         end_time: end_time,
                         venue_id: venue_id,
                       event_code: SecureRandom.hex(3))
        if street1
          event.addresses.create(
            street_1: street1,
            street_2: street2,
                city: city.downcase,
               state: state,
                 zip: zip)
        end
        return event
      else
        GraphQL::ExecutionError.new("Not authorized to create event!")
      end
    end
  end
end
