module Types
  class VenueAdminType < BaseObject
    field :id, Integer, null: true
    field :user_id, Integer, null: false
    field :venue_id, Integer, null: false
  end
end
