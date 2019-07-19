class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

  has_many :students, class_name: "User",
                     foreign_key: "guardian_id"

  belongs_to :guardian, optional: true, class_name: "User"

  has_many :addresses, :as => :addressable
  has_many :venues, through: :venue_admins
end
