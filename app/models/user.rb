class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :fullname, presence: true, uniqueness: true
end
