require 'rails_helper'

describe 'When I visit /users' do
  it 'returns all users' do
    User.create(name: "Matt Weiss", nickname: "Duce", email: "weiss.matt@outlook.com", password: "password", role: 0, phone_number: "5555555555")

    visit(api_v1_users_path)
    expect(page).to have_content("Matt Weiss")
  end
end
