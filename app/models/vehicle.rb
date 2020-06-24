# frozen_string_literal: true

# Vehicle model
class Vehicle < ApplicationRecord
  has_many :waypoints

  validates :vehicle_identifier, presence: true
  validates :vehicle_identifier, uniqueness: true

  def self.update_waypoints(vehicle, params)
    # delete vehicle identifier from hash
    params.delete('vehicle_identifier')
    params['vehicle'] = vehicle
    Waypoint.create!(params)
  end

  def self.create_and_update_waypoints(params)
    # create new vehicle with its identifier
    vehicle = Vehicle.create!(vehicle_identifier: params['vehicle_identifier'])

    # delete vehicle identifier from hash
    params.delete('vehicle_identifier')
    params['vehicle'] = vehicle
    Waypoint.create!(params)
  end
end
