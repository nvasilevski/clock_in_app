class User < ApplicationRecord
  ADMIN_LOGIN = 'admin'.freeze

  validates :login, presence: true, uniqueness: true
  validates :fullname, presence: true, uniqueness: true

  has_many :clock_events, class_name: 'Events::ClockEvent', dependent: :delete_all


  def status
    clock_events.persisted.last&.event_type || EventTypes::CLOCK_OUT
  end

  # Just to simplify logic as authentication funcatinality is not the main goal
  def is_admin?
    login == ADMIN_LOGIN
  end
end
