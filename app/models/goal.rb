class Goal < ApplicationRecord
  validates_presence_of :category
  validates_presence_of :name
  validates_presence_of :description
  has_many :achievement_goals
  has_many :achievements, through: :achievement_goals
end
