require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:username)}
    it{should validate_presence_of(:password)}
  end
  describe 'relationships' do
    it{should have_many(:students)}
    it{should belong_to(:guardian)}
    it{should have_many(:addresses)}
    it{should have_many(:venue_admins)}
    it{should have_many(:venues)}
    it{should have_many(:user_events)}
    it{should have_many(:events)}
    it{should have_many(:student_achv_goals)}
  end
end
