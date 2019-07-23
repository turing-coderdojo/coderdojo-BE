class Venue < ApplicationRecord
  validates_presence_of :name
  has_many :addresses, as: :addressable
  has_many :venue_admins
  has_many :users, through: :venue_admins
  has_many :events
  has_many :achievements
end
