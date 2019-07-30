module Events
  class ClockEvent < ApplicationRecord
    validates :event_type, presence: true, inclusion: EventTypes.list
    validates :user_id, presence: true

    belongs_to :user
  end
end
