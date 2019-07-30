module Admin
  class BaseController < ::AuthenticatedController
    before_action :require_admin_user

    private

    def require_admin_user
      redirect_back(fallback_location: root_path) unless current_user.is_admin?
    end
  end
end