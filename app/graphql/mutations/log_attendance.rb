module Mutations
  class LogAttendance < Mutations::BaseMutation
    argument :event_code, String, required: true

    type Types::UserEventType

    def resolve(event_code: nil)

      current_user = context[:current_user]
      attendance = UserEvent.find_by(user_id: current_user.id, event_id: event_id)
      event = Event.find_by(event_code: event_code)
      
      if (current_user && (current_user[:role] == 0) && attendance == nil)
        if event
          UserEvent.create(user_id: current_user.id, event_id: event.id)
        else
          GraphQL::ExecutionError.new("Incorrect Event Code!")
        end
      else
        GraphQL::ExecutionError.new("Cannot log attendance!")
      end
    end
  end
end
