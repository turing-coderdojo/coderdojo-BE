require 'rails_helper'

RSpec.describe AchievementGoal, type: :model do
  describe 'relationships' do
    it{should belong_to :goal}
    it{should belong_to :achievement}
  end
end
