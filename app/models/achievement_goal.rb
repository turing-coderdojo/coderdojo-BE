class AchievementGoal < ApplicationRecord
  belongs_to :achievement
  belongs_to :goal
  has_many :student_achv_goals

end
