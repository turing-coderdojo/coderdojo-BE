class Event < ApplicationRecord
  validates_presence_of :start_time
  validates_presence_of :end_time

  belongs_to :venue
  has_many :addresses, :as => :addressable
end
