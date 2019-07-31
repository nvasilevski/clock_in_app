class UserStatusValidator
  def self.can_create_event_for_user?(user, event_type)
    event_type != user.status
  end
end