module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_users, [UserType], null: false
    field :me, Types::UserType, null: true
    field :all_venues, [VenueType], null:true
    field :all_venue_admins, [VenueAdminType], null:true do
      argument :user_id, Integer, required: false
      argument :venue_id, Integer, required: false
    end

    def me
      context[:current_user]
    end

    def all_users
      User.all
    end

    def all_venues
      Venue.all
    end

    def all_venue_admins(user_id: nil, venue_id: nil)
      if user_id && venue_id
        VenueAdmin.where(user_id: user_id, venue_id: venue_id)
      elsif user_id
        VenueAdmin.where(user_id: user_id)
      elsif venue_id
        VenueAdmin.where(venue_id: venue_id)
      else
        VenueAdmin.all
      end
    end
  end
end
