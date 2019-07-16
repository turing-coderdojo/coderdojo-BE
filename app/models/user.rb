class User < ApplicationRecord
  validates_presence_of :nickname
  validates_presence_of :password
  validates_presence_of :role

  has_many :students, class_name: "User",
                     foreign_key: "guardian_id"

  belongs_to :guardian, optional: true, class_name: "User"
end
