class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :fullname, presence: true, uniqueness: true

  has_many :clock_events, class_name: 'Events::ClockEvent'
end
