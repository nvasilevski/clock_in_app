class ClockEventDecorator < BaseDecorator
  def pretty_name
    EventTypes.t(event_type)
  end

  def pretty_datetime
    created_at.to_formatted_s(:long_ordinal)
  end
end