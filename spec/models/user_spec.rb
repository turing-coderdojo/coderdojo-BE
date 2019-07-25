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

  describe 'instance_methods' do
    it 'is_venue_admin?' do
      admin_1 = User.create(name: "Admin One", username: "admin1", email: "example@admin1.com", password: "password", role: 2, phone_number: "5555555553")
      venue_1 = Venue.create(name: "Venue One", notes: "Here be Dragons", email: "example@venue.com", web_url: "www.venueone.com")
      venue_admin = VenueAdmin.create(user_id: admin_1.id, venue_id: venue_1.id)

    expect(admin_1.is_venue_admin?(venue_1.id)).to eq(venue_admin)
    end
  end
end
