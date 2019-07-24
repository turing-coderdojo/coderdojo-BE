module Types
  class AchievementType < BaseObject
    field :id, Integer, null: true
    field :name, String, null: true
    field :badge_url, String, null: true
    field :description, String, null: true
    field :goals, [GoalType], null: true, method: :goals
  end
end
