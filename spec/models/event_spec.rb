require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:start_time)}
    it{should validate_presence_of(:end_time)}
  end
end
