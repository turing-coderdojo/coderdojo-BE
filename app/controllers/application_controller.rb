class ApplicationController < ActionController::Base

  private

  def current_user
    token = request.headers["Authorization"].to_s
    username = Base64.decode64(token)

    User.find_by(username: username)
  end
end
