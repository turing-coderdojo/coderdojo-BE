class Achievement < ApplicationRecord
  belongs_to :venue
  has_many :achievement_goals
  has_many :goals, through: :achievement_goals
end
