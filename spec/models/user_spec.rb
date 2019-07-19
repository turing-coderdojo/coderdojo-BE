require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:username)}
    it{should validate_presence_of(:password)}
    it{should have_many(:venues)}
  end
end
