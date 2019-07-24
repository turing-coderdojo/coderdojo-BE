class StudentAchvGoal < ApplicationRecord
  belongs_to :user
  belongs_to :achievement_goal
  has_one :achievement, through: :achievement_goal
  has_one :goal, through: :achievement_goal
end
