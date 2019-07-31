module Events
  class ClockEvent < ApplicationRecord
    validates :event_type, presence: true, inclusion: EventTypes.list
    validates :user_id, presence: true
    validate :user_status_consistency

    belongs_to :user

    scope :persisted, -> { where.not(id: nil) }

    private

    def user_status_consistency
      return if UserStatusValidator.can_create_event_for_user?(user, event_type)

      errors[:base] << "You can't #{EventTypes.t(event_type)}"
    end
  end
end
