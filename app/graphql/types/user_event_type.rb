module Types
  class UserEventType < BaseObject
    field :id, Integer, null: true
    field :user_id, Integer, null: false
    field :event_id, Integer, null: false
    field :event, EventType, null: true, method: :event
    field :user, UserType, null: true, method: :user
  end
end
