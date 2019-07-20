module Types
  class EventType < BaseObject
    field :id, Integer, null: true
    field :name, String, null: false
    field :venue_id, Integer, null: false
    field :notes, String, null: true
    field :start_time, String, null: false
    field :end_time, String, null: false
    field :event_code, String, null: true
    field :addresses, [AddressType], null: true, method: :addresses
    field :venue, VenueType, null: true, method: :venue
  end
end
