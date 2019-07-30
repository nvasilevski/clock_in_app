class User < ApplicationRecord
  validates :login, presence: true
  validates :fullname, presence: true
end
