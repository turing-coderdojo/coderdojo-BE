class StudentAchvGoal < ApplicationRecord
  belongs_to :user
  belongs_to :achievement_goal
end
