class ServiceProvider < ApplicationRecord
  enum services: %i(airtel jio vodafone bsnl)
  has_one :user
  has_many :customers
end
