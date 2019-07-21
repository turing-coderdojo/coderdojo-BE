class Goal < ApplicationRecord
  validates_presence_of :category
  validates_presence_of :name
  validates_presence_of :description
end
