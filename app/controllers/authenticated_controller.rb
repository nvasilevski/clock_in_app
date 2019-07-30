class AuthenticatedController < ApplicationController
    before_action :require_login

    private

    helper_method :current_user
    def current_user
      @current_user ||= User.find_by(id: session[AuthenticationSystem::USER_ID_SESSION_KEY])
    end

    def require_login
      redirect_to login_path if current_user.nil?
    end
end