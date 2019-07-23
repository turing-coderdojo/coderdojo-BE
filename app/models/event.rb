class Event < ApplicationRecord
  validates_presence_of :start_time
  validates_presence_of :end_time

  validates_uniqueness_of :event_code

  belongs_to :venue
  has_many :addresses, :as => :addressable

  has_many :user_events
  has_many :users, through: :user_events
end
