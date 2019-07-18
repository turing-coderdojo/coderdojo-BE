module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_users, [UserType], null: false
    field :me, Types::UserType, null: true
    field :all_venues, [VenueType], null:true

    def me
      context[:current_user]
    end

    def all_users
      User.all
    end

    def all_venues
      Venue.all
    end
  end
end
