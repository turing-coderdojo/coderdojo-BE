require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:nickname)}
    it{should validate_presence_of(:password)}
    it{should validate_presence_of(:role)}
  end
end
