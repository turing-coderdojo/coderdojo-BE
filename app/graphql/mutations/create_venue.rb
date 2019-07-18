module Mutations
  class CreateVenue < Mutations::BaseMutation
    #Venue args
    argument :name, String, required: true
    argument :email, String, required: false
    argument :notes, String, required: false
    argument :web_url, String, required: false
    argument :photo_url, String, required: false

    #Address args
    argument :street_1, String, required: true
    argument :street_2, String, required: false
    argument :city, String, required: true
    argument :state, String, required: true
    argument :zip, String, required: true

    type Types::VenueType

    def resolve(name: nil,
               email: nil,
               notes: nil,
             web_url: nil,
           photo_url: nil,
             street1: nil,
             street2: nil,
                city: nil,
               state: nil,
                 zip: nil)

      if context[:current_user] && (context[:current_user][:role] == 3)
        venue = Venue.create(name: name,
                    email: email,
                    notes: notes,
                  web_url: web_url,
                photo_url: photo_url)

        venue.addresses.create(
          street_1: street1,
          street_2: street2,
              city: city,
             state: state,
               zip: zip)
        return venue
      else
        {error: "Not Authorized to create venue!"}
      end
    end
  end
end
