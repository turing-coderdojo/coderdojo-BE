require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it{should validate_presence_of :category}
    it{should validate_presence_of :name}
    it{should validate_presence_of :description}
    it{should have_many :achievement_goals}
  end
end
