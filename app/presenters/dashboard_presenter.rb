class DashboardPresenter
  EVENTS_PER_PAGE = 10

  attr_reader :current_user, :params
  
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def paginated_user_events
    @paginated_user_events ||= current_user.clock_events.order(created_at: :desc).paginate(paginate_params)
  end

  def user_events
    ClockEventDecorator.wrap(paginated_user_events.to_a)
  end

  def available_events
    EventTypes.list
  end

  def current_user_status
    I18n.t("user_statuses.#{current_user.status}")
  end

  private

  def paginate_params
    {
      page: params[:page] || 1,
      per_page: params[:per_page] || EVENTS_PER_PAGE
    }
  end
end