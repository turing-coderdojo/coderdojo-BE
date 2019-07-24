module Types
  class StudentAchvGoalType < BaseObject
    field :id, Integer, null: true
    field :student_id, Integer, null: true
    field :started_at, String, null: true
    field :completed_at, String, null: true
    field :achievement, AchievementType, null:true, method: :achievement
    field :goal, GoalType, null:true, method: :goal
  end
end
