module Types
  class VenueAdminType < BaseObject
    field :user_id, Integer, null: false
    field :venue_id, Integer, null: false
  end
end
