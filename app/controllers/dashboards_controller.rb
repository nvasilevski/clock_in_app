class DashboardsController < AuthenticatedController
  def show
    @presenter = DashboardPresenter.new(current_user)
  end
end
