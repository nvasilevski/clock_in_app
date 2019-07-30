module Admin
  class EventsController < BaseController
    DEFAULT_PER_PAGE = 10

    def index
      @paginated_events = Events::ClockEvent.order(created_at: :desc).paginate page: current_page, per_page: per_page
      @events = ClockEventDecorator.wrap(@paginated_events)
    end

    private

    def current_page
      params[:page] || 1
    end

    def per_page
      params[:per_page] || DEFAULT_PER_PAGE
    end
  end
end