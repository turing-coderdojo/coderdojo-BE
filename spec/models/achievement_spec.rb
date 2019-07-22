require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'relationships' do
    it{should belong_to :venue}
  end
end
