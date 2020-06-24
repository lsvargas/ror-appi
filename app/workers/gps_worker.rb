# frozen_string_literal: true

# GPS worker
class GpsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(vehicles)
    vehicles.each do |veh|
      vehicle = Vehicle.find_by(vehicle_identifier: veh['vehicle_identifier'])
      # If vehicle exists in db create waypoints
      if vehicle
        Vehicle.update_waypoints(vehicle, veh)
      # If not create vehicle and add waypoints
      else
        Vehicle.create_and_update_waypoints(veh)
      end
    end
  end
end
