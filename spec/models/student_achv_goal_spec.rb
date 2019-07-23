require 'rails_helper'

RSpec.describe StudentAchvGoal, type: :model do
  describe 'relationships' do
    it{should belong_to :user}
    it{should belong_to :achievement_goal}
  end
end
