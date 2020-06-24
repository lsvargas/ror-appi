# frozen_string_literal: true

# GPS waypoints model
class Waypoint < ApplicationRecord
  belongs_to :vehicle

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :sent_at, presence: true
end
