module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_users, [UserType], null: true
    field :me, UserType, null: true

    field :all_venues, [VenueType], null:true do
      argument :id, Integer, required: false
      argument :city, String, required: false
    end

    field :all_events, [EventType], null: true do
      argument :venue_id, Integer, required: false
    end

    field :all_venue_admins, [VenueAdminType], null:true do
      argument :user_id, Integer, required: false
      argument :venue_id, Integer, required: false
    end

    field :attendance, [UserEventType], null:true do
      argument :user_id, Integer, required: false
      argument :event_id, Integer, required: false
    end

    field :past_events, [EventType], null: true do
      argument :venue_id, Integer, required: true
    end

    field :future_events, [EventType], null: true do
      argument :venue_id, Integer, required: true
    end


    def me
      context[:current_user]
    end

    def all_users
      User.all
    end

    def all_venues(city: nil, id: nil)
      if city
        Venue.joins(:addresses).where(addresses: {city: city.downcase})
      elsif id
        Venue.where(id: id)
      else
        Venue.all
      end
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

    def all_events(venue_id: nil)
      if venue_id
        Event.where(venue_id: venue_id)
      else
        Event.all
      end
    end

    def attendance(user_id: nil, event_id: nil)
      if user_id && event_id
        UserEvent.where(user_id: user_id, event_id: event_id)
      elsif user_id
        UserEvent.where(user_id: user_id)
      elsif event_id
        UserEvent.where(event_id: event_id)
      else
        UserEvent.all
      end
    end

    def past_events(venue_id: nil)
      time = Time.now.to_formatted_s(:db)
      Event.where(venue_id: venue_id).where("start_time < ?", time).order(start_time: :desc).limit(3)
    end

    def future_events(venue_id: nil)
      time = Time.now.to_formatted_s(:db)
      Event.where(venue_id: venue_id).where("start_time > ?", time).order(start_time: :asc)
    end
  end
end
