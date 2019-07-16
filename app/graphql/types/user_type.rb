module Types
  class UserType < BaseObject
    field :id, Integer, null: true
    field :email, String, null: true
    field :nickname, String, null: false
    field :password, String, null: false
    field :role, Integer, null: false
    field :name, String, null: true
    field :notes, String, null: true
    field :phone_number, String, null: true
    field :guardian_id, Integer, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
