module Mutations
  class LogAttendance < Mutations::BaseMutation
    argument :event_id, Integer, required: true
    argument :event_code, String, required: true

    type Types::UserEventType

    def resolve(event_id: nil,
             event_code: nil)

      current_user = context[:current_user]
      event = Event.find(event_id)

      if (current_user && (current_user[:role] == 0))
        if event.event_code == event_code
          UserEvent.create(user_id: current_user.id, event_id: event_id)
        else
          GraphQL::ExecutionError.new("Incorrect Event Code!")
        end
      else
        GraphQL::ExecutionError.new("Not authorized to promote users!")
      end
    end
  end
end
