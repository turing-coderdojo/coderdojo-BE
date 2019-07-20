require 'rails_helper'

describe Venue, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
    it{should have_many(:users)}
  end
end
