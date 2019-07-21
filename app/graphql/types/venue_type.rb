module Types
  class VenueType < BaseObject
    field :id, Integer, null: true
    field :name, String, null: false
    field :notes, String, null: true
    field :email, String, null: true
    field :web_url, String, null: true
    field :photo_url, String, null: true
    field :addresses, [AddressType], null: true, method: :addresses
    field :events, [EventType], null: true, method: :events
  end
end
