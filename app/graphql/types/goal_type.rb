module Types
  class GoalType < BaseObject
    field :id, Integer, null: true
    field :category, String, null: true
    field :name, String, null: true
    field :img_url, String, null: true
    field :description, String, null: true
    field :achievements, [AchievementType], null: true, method: :achievements
  end
end
