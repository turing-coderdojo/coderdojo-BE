require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'relationships' do
    it{should belong_to :venue}
    it{should have_many :achievement_goals}
  end
end
