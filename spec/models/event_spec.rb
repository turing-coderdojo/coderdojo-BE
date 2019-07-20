require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:start_time)}
    it{should validate_presence_of(:end_time)}
  end
  describe 'relationships' do
    it{should belong_to(:venue)}
    it{should have_many(:addresses)}
    it{should have_many(:user_events)}
    it{should have_many(:users)}
  end
end
