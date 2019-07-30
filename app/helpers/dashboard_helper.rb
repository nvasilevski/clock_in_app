module DashboardHelper
  def clock_event_button(event)
    simple_form_for :clock_event, url: clock_events_path do |t|
      concat t.input :event_type, as: :hidden, input_html: { value: event }
      concat t.submit EventTypes.t(event), class: 'btn btn-primary'
    end
  end
end