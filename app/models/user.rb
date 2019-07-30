class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :fullname, presence: true, uniqueness: true

  has_many :clock_events, class_name: 'Events::ClockEvent'


  def status
    clock_events.last.event_type
  end
end
