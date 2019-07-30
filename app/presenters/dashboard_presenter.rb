class DashboardPresenter
  attr_reader :current_user
  
  def initialize(current_user)
    @current_user = current_user
  end

  def user_events
    # TODO: Add pagination
    ClockEventDecorator.wrap(current_user.clock_events.order(created_at: :desc).to_a)
  end

  def available_events
    EventTypes.list
  end

  def current_user_status
    I18n.t("user_statuses.#{current_user.status}")
  end
end