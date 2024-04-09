class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def authenticate
    if cookies[:user_id].nil?
      authenticate_or_request_with_http_basic do |u, p|
        User.find_by(username: u).authenticate(p)
        cookies.permanent[:user_id] = User.find_by(username: u).id
      end
    end
  end

  def current_user
    @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
  end
end
