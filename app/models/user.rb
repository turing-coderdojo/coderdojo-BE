class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

  has_many :students, class_name: "User",
                     foreign_key: "guardian_id"

  belongs_to :guardian, optional: true, class_name: "User"

  has_many :addresses, :as => :addressable

  has_many :venue_admins
  has_many :venues, through: :venue_admins

  has_many :user_events
  has_many :events, through: :user_events

  def is_venue_admin?(venue_id)
    VenueAdmin.find_by(user_id: id, venue_id: venue_id)
  end
end
