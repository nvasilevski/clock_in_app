module Admin
  class EventsController < BaseController
    DEFAULT_PER_PAGE = 10

    def index
      @paginated_events = Events::ClockEvent.order(created_at: :desc).paginate page: current_page, per_page: per_page
      @events = ClockEventDecorator.wrap(@paginated_events)
    end

    def edit
      @event = Events::ClockEvent.find(params[:id])
    end

    def update
      @event = Events::ClockEvent.find(params[:id])

      if @event.update(event_params)
        flash[:success] = "#{EventTypes.t(@event.event_type)} event was updated successfully"
        redirect_to admin_events_path
      else
        flash[:danger] = 'Cannot update event'
        render :edit
      end
    end

    def destroy
      event = Events::ClockEvent.find(params[:id])

      if event.destroy
        flash[:success] = "#{EventTypes.t(event.event_type)} event was deleted successfully"
      else
        flash[:danger] = 'Cannot delete event'
      end

      redirect_back(fallback_location: root_path)
    end

    private

    def event_params
      params.require(:events_clock_event).permit(:event_type, :created_at, :user_id)
    end

    def current_page
      params[:page] || 1
    end

    def per_page
      params[:per_page] || DEFAULT_PER_PAGE
    end
  end
end