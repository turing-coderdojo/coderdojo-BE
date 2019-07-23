module Mutations
  class UpdateEvent < Mutations::BaseMutation
    #Event args
    argument :id, Integer, required: true
    argument :name, String, required: false
    argument :notes, String, required: false
    argument :start_time, String, required: false
    argument :end_time, String, required: false
    argument :venue_id, Integer, required: false
    #Address args
    argument :street_1, String, required: false
    argument :street_2, String, required: false
    argument :city, String, required: false
    argument :state, String, required: false
    argument :zip, String, required: false

    type Types::EventType

    def resolve(id: nil,
              name: nil,
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
      event_params = {name: name,
                     notes: notes,
                start_time: start_time,
                  end_time: end_time,
                  venue_id: venue_id}

      if city
        sanitized_city = city.downcase
      end

      address_params = {street_1: street1,
                        street_2: street2,
                            city: sanitized_city,
                           state: state,
                             zip: zip}

      event = Event.find(id)

      if (current_user && current_user.is_venue_admin?(venue_id)) ||
        (current_user && (current_user[:role] == 3))
        event.update(event_params)
        if event.addresses[0]
          event.addresses[0].update(address_params)
        else
          event.addresses.create(address_params)
        end
        return event
      else
        GraphQL::ExecutionError.new("Not authorized to update event!")
      end
    end
  end
end
