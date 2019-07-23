require 'rails_helper'

describe Venue, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it{should have_many(:users)}
    it{should have_many(:events)}
    it{should have_many(:achievements)}
  end
end
