class DashboardsController < AuthenticatedController
  def show
    @presenter = DashboardPresenter.new(current_user, params)
  end
end
