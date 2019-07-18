class Venue < ApplicationRecord
  validates_presence_of :name
  has_many :addresses, as: :addressable
end
