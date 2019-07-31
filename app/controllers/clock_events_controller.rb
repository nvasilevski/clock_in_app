class ClockEventsController < AuthenticatedController
  def create
    event = current_user.clock_events.new(event_type: event_type)
    if event.save
      flash[:success] = t('clock_events.creation.success')
    else
      flash[:danger] = t('clock_events.creation.failure', errors: event.errors.full_messages.join(' '))
    end

    redirect_back(fallback_location: root_path)
  end

  private
  
  def event_type
    params.require(:clock_event).permit(:event_type)[:event_type]
  end
end